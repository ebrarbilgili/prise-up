import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/constants/app.dart';
import '../../../../../../../core/constants/provider/cache_provider.dart';
import '../../../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../../core/widgets/AlertDialog/alert_dialog_widget.dart';
import '../../viewmodel/create_project_viewmodel.dart';

class CreateProjectButton extends StatefulWidget {
  CreateProjectButton({Key? key, required this.viewModel}) : super(key: key);

  final CreateProjectViewModel viewModel;

  @override
  _CreateProjectButtonState createState() => _CreateProjectButtonState();
}

class _CreateProjectButtonState extends State<CreateProjectButton> {
  @override
  Widget build(BuildContext context) {
    final userID = context.read<CacheProvider>().getStringCache('id');
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: context.paddingLow,
        child: ElevatedButton(
          onPressed: () async {
            buildShowLoaderDialog(
                context,
                LocaleKeys.sign_up_please_wait.locale,
                '',
                [CircularProgressIndicatorWidget()]);
            if (userID != null) {
              await widget.viewModel
                  .createProject(int.parse(userID))
                  .whenComplete(() async {
                buildShowDialog(
                  context,
                  LocaleKeys.find_investor_create_project_created.locale,
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
              });
            }
          },
          child: buildButtonText(context),
        ),
      ),
    );
  }

  AutoSizeText buildButtonText(BuildContext context) {
    return AutoSizeText(
      LocaleKeys.find_investor_create_project_create_project.locale,
      style: context.textTheme.bodyText1!
          .copyWith(color: context.colorScheme.background),
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
