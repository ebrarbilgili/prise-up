import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../MyProjectsDetailsView/view/my_projects_details_view.dart';
import '../model/my_projects_model.dart';
import '../service/my_projects_service.dart';
import '../viewmodel/my_projects_viewmodel.dart';

class MyProjectsView extends StatelessWidget {
  MyProjectsView({Key? key}) : super(key: key);

  final viewModel = MyProjectsViewModel(service: MyProjectsService());

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

  ListView buildBody(BuildContext context) {
    return viewModel.myProjectsModel.isNullOrEmpty
        ? buildNoProjectText(context)
        : buildListView(context);
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.myProjectsModel.length,
      itemBuilder: (BuildContext context, int index) {
        final data = viewModel.myProjectsModel[index];
        return Card(
          child: ListTile(
            title: buildProjectTitle(data, context),
            subtitle: buildCardSubColumn(data, context),
            trailing: buildDetailsButton(context, data),
          ),
        );
      },
    );
  }

  TextButton buildDetailsButton(BuildContext context, MyProjectsModel data) {
    return TextButton(
      onPressed: () {
        context.navigation.push(
          MaterialPageRoute(
            builder: (context) => MyProjectsDetailsView(model: data),
          ),
        );
      },
      child: LocaleText(text: LocaleKeys.home_home_detail),
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        text: LocaleKeys.home_my_projects_my_projects,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onBackground),
      ),
      centerTitle: false,
    );
  }

  Divider get buildDivider => Divider();
}
