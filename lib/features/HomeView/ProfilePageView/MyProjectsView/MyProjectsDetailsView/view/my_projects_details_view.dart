import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../model/my_projects_model.dart';
import '../EditProjectView/view/edit_project_view.dart';
import '../constants/widget/appliances_list.dart';
import '../constants/widget/delete_button.dart';

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
      body: buildBody(context),
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context),
          buildSubtitle(context),
          buildDivider,
          buildDescription,
          buildDivider,
          buildEditAndDeleteButtons(context),
          buildDivider,
          Expanded(child: buildAppliancesList(context)),
        ],
      ),
    );
  }

  Row buildEditAndDeleteButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildEditButton(context),
        buildDeleteButtonWidget,
      ],
    );
  }

  DeleteButtonWidget get buildDeleteButtonWidget =>
      DeleteButtonWidget(model: model);

  ElevatedButton buildEditButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.navigation.push(MaterialPageRoute(
          builder: (context) => EditProjectView(model: model),
        ));
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(context.paddingNormal),
      ),
      icon:
          FaIcon(FontAwesomeIcons.edit, color: context.colorScheme.background),
      label: LocaleText(
        text: LocaleKeys.home_my_projects_edit,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.background),
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
