import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/constants/app.dart';
import '../../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../core/lang/locale_key.g.dart';
import '../../../ProfilePageView/MyProjectsView/model/my_projects_model.dart';
import '../../../ProfilePageView/MyProjectsView/service/my_projects_service.dart';
import '../constants/widget/choose_project_button.dart';
import '../service/choose_project_service.dart';
import '../viewmodel/choose_project_viewmodel.dart';

class ChooseProjectView extends StatelessWidget {
  ChooseProjectView({Key? key}) : super(key: key);

  final viewModel = ChooseProjectViewModel(
    myProjectsService: MyProjectsService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
    chooseProjectService: ChooseProjectService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Observer(builder: (context) {
        return viewModel.isLoading == false
            ? buildCircularProgressWidget
            : viewModel.myProjectsModel.isNullOrEmpty
                ? buildNoProjectText
                : buildListView();
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: viewModel.myProjectsModel.length,
      itemBuilder: (BuildContext context, int index) {
        final data = viewModel.myProjectsModel[index];
        return Card(
          child: ListTile(
            title: buildProjectTitle(data, context),
            subtitle: buildCardSubColumn(data, context),
            trailing: ChooseProjectButton(
              model: data,
              viewModel: viewModel,
              index: index,
            ),
            // trailing: buildDetailsButton(context, data),
          ),
        );
      },
    );
  }

  AutoSizeText buildProjectTitle(MyProjectsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.title}',
      style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Column buildCardSubColumn(MyProjectsModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDivider,
        buildSubtitle(data, context),
        buildUniversity(data, context),
      ],
    );
  }

  AutoSizeText buildUniversity(MyProjectsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.university}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildSubtitle(MyProjectsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.subtitle}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Column get buildCircularProgressWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(child: CircularProgressIndicatorWidget()),
        ),
      ],
    );
  }

  Column get buildNoProjectText {
    return Column(
      children: [
        Center(
          child: Center(
            child: AutoSizeText(
                LocaleKeys.home_my_projects_project_list_empty.locale),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: AutoSizeText(
        LocaleKeys.find_investor_choose_project_choose_project.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.secondaryVariant),
      ),
    );
  }

  Divider get buildDivider => Divider();
}
