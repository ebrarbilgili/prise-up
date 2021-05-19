import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/widgets/LocaleText/locale_text.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildBody,
      bottomNavigationBar: Container(
          height: context.dynamicHeight(0.1),
          decoration: buildBoxDecoration(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBottomNavigationBarItemHome(context),
              buildBottomNavigationBarItemProfile(context)
            ],
          )),
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
      color: context.colorScheme.secondaryVariant,
    );
  }

  Center get buildBody {
    return Center(
      child: Observer(builder: (_) {
        return viewModel.widgetOptions.elementAt(viewModel.selectedIndex);
      }),
    );
  }

  Column buildBottomBarItemIcons(
      BuildContext context, IconData iconData, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          iconData,
          color: context.colorScheme.onSecondary,
        ),
        LocaleText(
          text: title,
          style: context.textTheme.bodyText1!
              .copyWith(color: context.colorScheme.onSecondary),
        )
      ],
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(context.colorScheme.secondaryVariant),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.all(context.colorScheme.secondary),
      foregroundColor: MaterialStateProperty.all(context.colorScheme.error),
      animationDuration: Duration(seconds: 0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: Image.asset(AppConstants.APPBAR_LOGO),
      automaticallyImplyLeading: false,
    );
  }
}
