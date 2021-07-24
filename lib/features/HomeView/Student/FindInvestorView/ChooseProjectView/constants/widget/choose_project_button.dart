import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/constants/provider/cache_provider.dart';
import '../../../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../../core/lang/locale_key.g.dart';
import '../../../../ProfilePageView/MyProjectsView/model/my_projects_model.dart';
import '../../viewmodel/choose_project_viewmodel.dart';

class ChooseProjectButton extends StatefulWidget {
  ChooseProjectButton(
      {Key? key,
      required this.viewModel,
      required this.model,
      required this.index})
      : super(key: key);
  final ChooseProjectViewModel viewModel;
  final MyProjectsModel model;
  final int index;

  @override
  _ChooseProjectButtonState createState() => _ChooseProjectButtonState();
}

class _ChooseProjectButtonState extends State<ChooseProjectButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userID = context.read<CacheProvider>().getStringCache('id');
    return FutureBuilder<List<MyProjectsModel>>(
        future: widget.viewModel.myProjectsService.fetchMyProjects(),
        builder: (context, snapshot) {
          if (isLoading == true) {
            return CircularProgressIndicatorWidget();
          }
          if (snapshot.data?[widget.index].is_looking_for_investor == true) {
            return FaIcon(FontAwesomeIcons.check, color: Colors.green);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicatorWidget();
          } else {
            return TextButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if (userID != null) {
                  await widget.viewModel
                      .chooseProject(widget.model, int.parse(userID))
                      .whenComplete(() async {
                    await widget.viewModel
                        .isChoosedProject(widget.model, int.parse(userID));
                  });
                }
                setState(() {
                  isLoading = false;
                });
              },
              child: AutoSizeText(
                  LocaleKeys.find_investor_choose_project_choose.locale),
            );
          }

          // snapshot.data?[widget.index].is_looking_for_investor == true
          //     ? FaIcon(FontAwesomeIcons.check, color: Colors.green)
          //     : ;
        });
  }
}
