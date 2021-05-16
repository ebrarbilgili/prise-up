import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../core/constants/app.dart';
import '../../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../../../UserProfileView/view/user_profile_view.dart';
import '../../../model/my_projects_model.dart';
import '../../model/my_projects_details_model.dart';
import '../../service/my_projects_details_service.dart';
import '../../viewmodel/my_projects_details_viewmodel.dart';

class AppliancesList extends StatefulWidget {
  AppliancesList({
    Key? key,
    required this.model,
  }) : super(key: key);
  final MyProjectsModel model;

  @override
  _AppliancesListState createState() => _AppliancesListState();
}

class _AppliancesListState extends State<AppliancesList> {
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
    return Observer(builder: (context) {
      return RefreshIndicator(
        key: viewModel.refreshIndicatorKey,
        color: context.colorScheme.primary,
        onRefresh: viewModel.onRefresh,
        child: buildBody(context),
      );
    });
  }

  ListView buildBody(BuildContext context) {
    return viewModel.applianceList.isNullOrEmpty
        ? buildNooneText(context)
        : buildListView(context);
  }

  ListView buildNooneText(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: context.dynamicHeight(0.8),
          child: Center(
            child: LocaleText(
              text: LocaleKeys.home_my_projects_project_list_empty,
              style: context.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.applianceList.length,
      itemBuilder: (BuildContext context, int index) {
        final data = viewModel.applianceList[index];
        return Card(
          child: ListTile(
            title: buildTitle(data, context),
            subtitle: buildCardSubColumn(data, context),
            trailing: TextButton(
              onPressed: () {
                context.navigation.push(
                  MaterialPageRoute(
                    builder: (context) => UserProfileView(
                      model: data,
                    ),
                  ),
                );
              },
              child: LocaleText(text: LocaleKeys.home_home_detail),
            ),
          ),
        );
      },
    );
  }

  AutoSizeText buildTitle(MyProjectsDetailsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.applyUserProfile!.first_name} ${data.applyUserProfile!.last_name}',
      style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Column buildCardSubColumn(MyProjectsDetailsModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDivider,
        buildEmail(data, context),
        buildUniversity(data, context),
        buildFaculty(data, context),
      ],
    );
  }

  AutoSizeText buildFaculty(MyProjectsDetailsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.applyUserProfile!.faculty}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildUniversity(
      MyProjectsDetailsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.applyUserProfile!.university}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildEmail(MyProjectsDetailsModel data, BuildContext context) {
    return AutoSizeText(
      '${data.applyUserProfile!.email}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  Divider get buildDivider => Divider();
}
