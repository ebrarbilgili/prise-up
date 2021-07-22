import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../../../core/extensions/locale_extensions.dart';
import '../../../../../core/lang/locale_key.g.dart';
import '../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../SearchView/view/search_view.dart';
import '../../../Student/HomePageView/DetailsView/view/details_view.dart';
import '../model/home_page_model.dart';
import '../service/home_page_service.dart';
import '../viewmodel/home_page_viewmodel.dart';

class BusinessHomePageView extends StatelessWidget {
  BusinessHomePageView({Key? key}) : super(key: key);

  final viewModel = HomePageViewModel(
    businessHomePageProjectService: BusinessHomePageProjectService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return RefreshIndicator(
            key: viewModel.refreshIndicatorKey,
            color: context.colorScheme.primary,
            onRefresh: viewModel.getProjectsForInvestors,
            child: Column(
              children: [
                SearchView(projectList: viewModel.projectsForInvestorsList),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      return viewModel.isLoading == false
                          ? buildCircularProgressIndicator
                          : viewModel.projectsForInvestorsList.isNotNullOrEmpty
                              ? ListView.builder(
                                  itemCount:
                                      viewModel.projectsForInvestorsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final data = viewModel
                                        .projectsForInvestorsList[index];
                                    return buildCard(data, context);
                                  },
                                )
                              : buildNoProjectText(context);
                    },
                  ),
                ),
              ],
            ));
      },
    );
  }

  Card buildCard(BusinessGetProjectModel data, BuildContext context) {
    return Card(
      child: ListTile(
        title: buildProjectTitle(data, context),
        subtitle: buildCardSubColumn(data, context),
        trailing: buildDetailsButton(data, context),
      ),
    );
  }

  Column buildCardSubColumn(
      BusinessGetProjectModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDivider,
        buildSubtitle(data, context),
        buildUniversity(data, context),
        buildFullname(data, context),
      ],
    );
  }

  AutoSizeText buildFullname(
      BusinessGetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.userProfile!.first_name} ${data.userProfile!.last_name}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildUniversity(
      BusinessGetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.university}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildSubtitle(
      BusinessGetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.subtitle}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  TextButton buildDetailsButton(
      BusinessGetProjectModel data, BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigation.push(MaterialPageRoute(
          builder: (context) => DetailsView(model: data),
        ));
      },
      child: LocaleText(text: LocaleKeys.home_home_detail),
    );
  }

  Divider get buildDivider => Divider();

  Row buildProjectTitle(BusinessGetProjectModel data, BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          '${data.title} ',
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        AutoSizeText(
          '${LocaleKeys.home_home_id.locale}: ${data.id}',
          style: context.textTheme.bodyText1!
              .copyWith(fontWeight: FontWeight.w200),
        ),
      ],
    );
  }

  ListView buildNoProjectText(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: context.dynamicHeight(0.8),
          child: Center(
            child: LocaleText(
              text: LocaleKeys.home_home_project_list_empty,
              style: context.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Column get buildCircularProgressIndicator {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircularProgressIndicatorWidget(),
        )
      ],
    );
  }
}
