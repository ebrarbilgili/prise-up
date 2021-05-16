import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import 'package:teammate/core/constants/app.dart';
import 'package:teammate/core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import 'package:teammate/core/extensions/locale_extensions.dart';
import 'package:teammate/core/lang/locale_key.g.dart';
import 'package:teammate/core/widgets/AlertDialog/alert_dialog_widget.dart';
import 'package:teammate/core/widgets/LocaleText/locale_text.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/service/my_projects_details_service.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/viewmodel/my_projects_details_viewmodel.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/model/my_projects_model.dart';

class DeleteButtonWidget extends StatefulWidget {
  DeleteButtonWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MyProjectsModel model;

  @override
  _DeleteButtonWidgetState createState() => _DeleteButtonWidgetState();
}

class _DeleteButtonWidgetState extends State<DeleteButtonWidget> {
  late MyProjectsDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = MyProjectsDetailsViewModel(
      projectID: widget.model.id!,
      service: MyProjectsDetailsService(
        service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        buildShowLoaderDialog(context, LocaleKeys.sign_up_please_wait.locale,
            '', [CircularProgressIndicatorWidget()]);

        await viewModel.deleteProject(widget.model.id!).whenComplete(() async {
          buildShowDialog(
            context,
            LocaleKeys.home_my_projects_deleted.locale,
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
      },
      icon:
          FaIcon(FontAwesomeIcons.trash, color: context.colorScheme.background),
      style: buildButtonStyle(context),
      label: buildLocaleText(context),
    );
  }

  LocaleText buildLocaleText(BuildContext context) {
    return LocaleText(
      text: LocaleKeys.home_my_projects_delete,
      style: context.textTheme.headline6!
          .copyWith(color: context.colorScheme.background),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
        padding: MaterialStateProperty.all(context.paddingNormal));
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
