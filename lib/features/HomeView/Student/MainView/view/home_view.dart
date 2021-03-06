import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/constants/app.dart';
import '../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../../../../../core/extensions/locale_extensions.dart';
import '../../../../../core/lang/locale_key.g.dart';
import '../../../../../core/widgets/LocaleText/locale_text.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final readCacheProvider = SharedPreferencesConstant.instance;

  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody,
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Container buildBottomNavigationBar(BuildContext context) {
    return Container(
        height: context.dynamicHeight(0.1),
        decoration: buildBoxDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomNavigationBarItemFindInvestor(context),
            buildBottomNavigationBarItemHome(context),
            buildBottomNavigationBarItemProfile(context),
          ],
        ));
  }

  Expanded buildBottomNavigationBarItemFindInvestor(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          viewModel.selectedIndex = 2;
        },
        style: buildButtonStyle(context),
        child: buildBottomBarItemIcons(
          context,
          FontAwesomeIcons.handHoldingUsd,
          LocaleKeys.find_investor_find_investor,
        ),
      ),
    );
  }

  Expanded buildBottomNavigationBarItemProfile(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          viewModel.selectedIndex = 1;
        },
        style: buildButtonStyle(context),
        child: buildBottomBarItemIcons(
          context,
          FontAwesomeIcons.solidUser,
          LocaleKeys.home_profile_profile,
        ),
      ),
    );
  }

  Expanded buildBottomNavigationBarItemHome(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          viewModel.selectedIndex = 0;
        },
        style: buildButtonStyle(context),
        child: buildBottomBarItemIcons(
          context,
          FontAwesomeIcons.home,
          LocaleKeys.home_home_home,
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: context.normalRadius,
        topRight: context.normalRadius,
      ),
      border: Border.all(color: context.colorScheme.secondary),
      color: context.colorScheme.surface,
    );
  }

  Widget get buildBody {
    return Observer(builder: (_) {
      return viewModel.widgetOptions.elementAt(viewModel.selectedIndex);
    });
  }

  Column buildBottomBarItemIcons(
      BuildContext context, IconData iconData, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          iconData,
          color: context.colorScheme.secondaryVariant,
        ),
        LocaleText(
          text: title,
          style: context.textTheme.bodyText1!
              .copyWith(color: context.colorScheme.secondaryVariant),
        )
      ],
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(context.colorScheme.background),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(context.colorScheme.secondary),
      foregroundColor: MaterialStateProperty.all(context.colorScheme.error),
      animationDuration: Duration(seconds: 0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.primary,
      title: AutoSizeText(
        '${LocaleKeys.home_home_welcome.locale}, ${readCacheProvider.getStringValue('first_name')}!',
        style: context.textTheme.bodyText1!
            .copyWith(color: context.colorScheme.background),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.dynamicHeight(0.02)),
          child: Image.asset(
            AppConstants.APPBAR_LOGO_WHITE,
            // scale: 1.5,
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
