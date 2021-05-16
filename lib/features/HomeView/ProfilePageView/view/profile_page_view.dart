import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:teammate/core/widgets/LocaleText/locale_text.dart';
import 'package:teammate/features/HomeView/ProfilePageView/ApplicationsView/view/applications_view.dart';
import 'package:teammate/features/HomeView/ProfilePageView/CreateProjectView/view/create_project_view.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/view/my_projects_view.dart';
import 'package:teammate/features/UserProfileView/view/user_profile_view.dart';

import '../../../../core/constants/provider/cache_provider.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../LoginView/view/login_view.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildMyProfileButton(context),
        buildCreateProjectButton(context),
        buildMyProjectsView(context),
        buildApplicationsButton(context),
        buildLogoutButton(context),
      ],
    );
  }

  Container buildMyProfileButton(BuildContext context) {
    return Container(
      decoration: buildButtonBorderDecoration(context),
      child: TextButton(
        onPressed: () {
          context.navigation.push(
            MaterialPageRoute(
              builder: (context) => UserProfileView(),
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: LocaleText(
            text: LocaleKeys.home_user_profile_my_profile,
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Container buildMyProjectsView(BuildContext context) {
    return Container(
      decoration: buildButtonBorderDecoration(context),
      child: TextButton(
        onPressed: () {
          context.navigation.push(
            MaterialPageRoute(
              builder: (context) => MyProjectsView(),
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: LocaleText(
            text: LocaleKeys.home_my_projects_my_projects,
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Container buildApplicationsButton(BuildContext context) {
    return Container(
      decoration: buildButtonBorderDecoration(context),
      child: TextButton(
        onPressed: () {
          context.navigation.push(
            MaterialPageRoute(
              builder: (context) => ApplicationsView(),
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: LocaleText(
            text: LocaleKeys.home_profile_my_applications_applications,
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Container buildCreateProjectButton(BuildContext context) {
    return Container(
      decoration: buildButtonBorderDecoration(context),
      child: TextButton(
        onPressed: () {
          context.navigation.push(
            MaterialPageRoute(
              builder: (context) => CreateProjectView(),
            ),
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: LocaleText(
            text: LocaleKeys.home_profile_project_create_project,
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Container buildLogoutButton(BuildContext context) {
    return Container(
      decoration: buildButtonBorderDecoration(context),
      child: TextButton(
        onPressed: () async {
          await context.read<CacheProvider>().clearCache();
          await context.navigation.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
            (route) => false,
          );
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: LocaleText(
            text: LocaleKeys.home_profile_logout,
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.error),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildButtonBorderDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: context.colorScheme.onSecondary, width: 2),
      ),
    );
  }
}
