import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/extensions/locale_extensions.dart';
import '../../../../../../core/lang/locale_key.g.dart';
import '../../ChooseProjectView/view/choose_project_view.dart';
import '../../CreateProjectView/view/create_project_view.dart';
import '../constants/widget/card_widget.dart';

class FindInvestorView extends StatelessWidget {
  const FindInvestorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.horizontalPaddingLow,
      children: [buildCreateCard, buildChooseCard],
    );
  }

  Widget get buildChooseCard {
    return FindInvestorCard(
      leadingIcon: FontAwesomeIcons.archive,
      title: LocaleKeys.find_investor_choose_project_choose_project.locale,
      subtitle: LocaleKeys.find_investor_choose_present_investor.locale,
      trailingIcon: FontAwesomeIcons.angleDoubleRight,
      page: ChooseProjectView(),
    );
  }

  Widget get buildCreateCard {
    return FindInvestorCard(
      leadingIcon: FontAwesomeIcons.handHoldingUsd,
      title: LocaleKeys.find_investor_create_project_create_project.locale,
      subtitle: LocaleKeys.find_investor_create_project_create_project.locale,
      trailingIcon: FontAwesomeIcons.angleDoubleRight,
      page: CreateProjectView(),
    );
  }
}
