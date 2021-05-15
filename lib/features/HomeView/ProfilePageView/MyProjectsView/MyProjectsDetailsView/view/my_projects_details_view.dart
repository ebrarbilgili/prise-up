import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/view/appliances_list.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/model/my_projects_model.dart';

class MyProjectsDetailsView extends StatelessWidget {
  MyProjectsDetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MyProjectsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: context.horizontalPaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(context),
            buildSubtitle(context),
            buildDivider,
            buildDescription,
            buildDivider,
            Expanded(child: buildAppliancesList(context)),
          ],
        ),
      ),
    );
  }

  AutoSizeText get buildDescription => AutoSizeText('${model.desc!}');

  AutoSizeText buildSubtitle(BuildContext context) {
    return AutoSizeText(
      '${model.subtitle}',
      style: context.textTheme.headline6,
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      '${model.title}',
      style: context.textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold, color: context.colorScheme.onPrimary),
    );
  }

  AppliancesList buildAppliancesList(BuildContext context) =>
      AppliancesList(model: model);

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        model.title ?? '',
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onBackground),
      ),
      centerTitle: false,
    );
  }

  Divider get buildDivider => Divider();
}
