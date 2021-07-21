import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../../core/lang/locale_key.g.dart';
import '../../../../../../../core/widgets/LocaleText/locale_text.dart';
import '../../../../../../UserProfileView/view/user_profile_view.dart';
import '../../model/applications_model.dart';

class ApplicationsDetailsView extends StatelessWidget {
  const ApplicationsDetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AppliedModel model;

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
      child: ListView(
        children: [
          buildTitle(context),
          buildSubtitle(context),
          buildDivider,
          buildDescription,
          buildDivider,
          buildCard(context)
        ],
      ),
    );
  }

  AutoSizeText get buildDescription => AutoSizeText('${model.project!.desc!}');

  AutoSizeText buildSubtitle(BuildContext context) {
    return AutoSizeText(
      '${model.project!.subtitle}',
      style: context.textTheme.headline6,
    );
  }

  Card buildCard(BuildContext context) {
    return Card(
      shape: buildRoundedRectangleBorder(context),
      elevation: 2,
      child: Padding(
        padding: context.paddingLow,
        child: ListTile(
          title: AutoSizeText(
              '${model.project!.userProfile!.first_name} ${model.project!.userProfile!.last_name}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDivider,
              // AutoSizeText('@${model.userProfile!.user!.username}'),
              AutoSizeText('${model.project!.userProfile!.email}'),
              AutoSizeText(
                  '${model.project!.userProfile!.university} - ${model.project!.city}'),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              context.navigation.push(MaterialPageRoute(
                builder: (context) => UserProfileView(appliedModel: model),
              ));
            },
            child: LocaleText(text: LocaleKeys.home_home_detail),
          ),
        ),
      ),
    );
  }

  RoundedRectangleBorder buildRoundedRectangleBorder(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: context.lowBorderRadius * 1.4,
      side: BorderSide(
        color: context.colorScheme.secondary,
        width: 1.6,
      ),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      '${model.project!.title}',
      style: context.textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold, color: context.colorScheme.onPrimary),
    );
  }

  Divider get buildDivider => Divider();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        '${model.project!.title} ${LocaleKeys.home_home_detail_page_project_detail.locale}',
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onPrimary),
      ),
      centerTitle: false,
    );
  }

  TextButton buildCancelButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigation.pop();
      },
      child: Text(
        LocaleKeys.home_home_detail_page_cancel.locale,
      ),
    );
  }
}
