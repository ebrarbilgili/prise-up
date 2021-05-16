import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../../core/constants/app.dart';
import '../../../../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../model/my_projects_model.dart';
import '../../viewmodel/edit_project_viewmodel.dart';

class EditProjectButtonWidget extends StatefulWidget {
  EditProjectButtonWidget({
    Key? key,
    required this.model,
    required this.viewModel,
  }) : super(key: key);

  final MyProjectsModel model;
  final EditProjectViewModel viewModel;

  @override
  _EditProjectButtonWidgetState createState() =>
      _EditProjectButtonWidgetState();
}

class _EditProjectButtonWidgetState extends State<EditProjectButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton.icon(
          onPressed: () async {
            buildShowLoaderDialog(
                context,
                LocaleKeys.sign_up_please_wait.locale,
                '',
                [CircularProgressIndicatorWidget()]);

            await widget.viewModel
                .editProject(widget.model.id!)
                .whenComplete(() async {
              buildShowDialog(
                context,
                LocaleKeys.home_my_projects_edited.locale,
                '',
                [
                  Lottie.asset(AppConstants.LOTTIE_CONFRIM,
                      height: context.dynamicHeight(0.1))
                ],
              );

              await Future.delayed(Duration(milliseconds: 1470));
              context.navigation.pop();
              context.navigation.pop();
              context.navigation.pop();
              context.navigation.pop();
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.edit,
            color: context.colorScheme.background,
          ),
          style: ButtonStyle(
              padding: MaterialStateProperty.all(context.paddingNormal)),
          label: LocaleText(
            text: LocaleKeys.home_my_projects_edit,
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.background),
          ),
        ),
      ),
    );
  }

  void buildShowLoaderDialog(BuildContext context, String title,
      String warningText, List<Widget>? actions) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialogAtomic(
          title: Text(title), actions: actions, children: [Text(warningText)]),
    );
  }

  void buildShowDialog(BuildContext context, String title, String warningText,
      List<Widget>? actions) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialogAtomic(
          title: Text(title), actions: actions, children: [Text(warningText)]),
    );
  }
}
