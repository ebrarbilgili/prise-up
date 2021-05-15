import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/core/constants/app.dart';
import 'package:teammate/core/lang/locale_key.g.dart';
import 'package:teammate/core/widgets/LocaleText/locale_text.dart';
import 'package:teammate/features/HomeView/ProfilePageView/ApplicationsView/ApplicationsDetailsView/view/applications_details_view.dart';
import 'package:teammate/features/HomeView/ProfilePageView/ApplicationsView/model/applications_model.dart';
import 'package:teammate/features/HomeView/ProfilePageView/ApplicationsView/service/applications_service.dart';
import 'package:teammate/features/HomeView/ProfilePageView/ApplicationsView/viewmodel/applications_viewmodel.dart';

class ApplicationsView extends StatelessWidget {
  ApplicationsView({Key? key}) : super(key: key);

  final viewModel = ApplicationsViewModel(
    service: ApplicationsService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Observer(
        builder: (context) {
          return RefreshIndicator(
            key: viewModel.refreshIndicatorKey,
            color: context.colorScheme.primary,
            onRefresh: viewModel.onRefresh,
            child: buildBody(context),
          );
        },
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return viewModel.applicationsList.isNullOrEmpty
        ? buildNoProjectText(context)
        : buildListView(context);
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.applicationsList.length,
      itemBuilder: (BuildContext context, int index) {
        final data = viewModel.applicationsList[index];
        return buildCard(data, context);
      },
    );
  }

  Card buildCard(AppliedModel data, BuildContext context) {
    return Card(
      child: ListTile(
        title: buildProjectTitle(data, context),
        subtitle: buildCardSubColumn(data, context),
        trailing: buildDetailsButton(data, context),
      ),
    );
  }

  TextButton buildDetailsButton(AppliedModel data, BuildContext context) {
    return TextButton(
      onPressed: () {
        // print(SharedPreferencesConstant.instance.getStringValue('id'));
        context.navigation.push(MaterialPageRoute(
          builder: (context) => ApplicationsDetailsView(model: data),
        ));
      },
      child: LocaleText(text: LocaleKeys.home_home_detail),
    );
  }

  Column buildCardSubColumn(AppliedModel data, BuildContext context) {
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

  AutoSizeText buildFullname(AppliedModel data, BuildContext context) {
    return AutoSizeText(
      '${data.project!.userProfile!.first_name} ${data.project!.userProfile!.last_name}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildUniversity(AppliedModel data, BuildContext context) {
    return AutoSizeText(
      '${data.project!.university}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildSubtitle(AppliedModel data, BuildContext context) {
    return AutoSizeText(
      '${data.project!.subtitle}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildProjectTitle(AppliedModel data, BuildContext context) {
    return AutoSizeText(
      '${data.project!.title}',
      style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget buildNoProjectText(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: context.dynamicHeight(0.8),
          child: Center(
            child: LocaleText(
              text:
                  LocaleKeys.home_profile_my_applications_appliance_list_empty,
              style: context.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        text: LocaleKeys.home_profile_my_applications_applications,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onBackground),
      ),
      centerTitle: false,
    );
  }

  Divider get buildDivider => Divider();
}
