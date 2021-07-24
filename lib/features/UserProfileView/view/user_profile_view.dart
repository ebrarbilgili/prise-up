import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/widgets/LocaleText/locale_text.dart';
import '../service/user_profile_service.dart';
import '../viewmodel/user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({
    Key? key,
    this.model,
    this.isMyProfile,
  }) : super(key: key);

  final dynamic model;
  final bool? isMyProfile;

  final viewModel = UserProfileViewModel(
    service: UserProfileService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildListView(context),
    );
  }

  Padding buildListView(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: ListView(
        children: [
          buildFullname(model, context),
          buildUniversity(model, context),
          buildFaculty(model, context),
          buildCity(model, context),
          buildContactRow(context),
          buildDivider,
          buildTwitter(model, context),
          buildDivider,
          buildLinkedin(model, context),
          buildDivider,
          buildPhone(context, model),
          buildDivider,
          buildEmail(context, model),
        ],
      ),
    );
  }

  Padding buildContactRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.dynamicHeight(0.02)),
      child: Row(
        children: [
          AutoSizeText(
            LocaleKeys.home_user_profile_contact_info.locale,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget buildEmail(BuildContext context, dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            '  ${isMyProfile == true ? viewModel.readCache('email') : data.email ?? '-'}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.solidEnvelope,
          color: context.colorScheme.primary,
        ),
      ],
    );
  }

  Widget buildPhone(BuildContext context, dynamic data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            '  ${isMyProfile == true ? viewModel.readCache('phone') : data.phone ?? '-'}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.phone,
          color: context.colorScheme.primary,
        ),
      ],
    );
  }

  Widget buildLinkedin(dynamic data, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            '  ${isMyProfile == true ? viewModel.readCache('linkedIn') : data.linkedIn ?? '-'}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.linkedin,
          color: Colors.blue.shade900,
        ),
      ],
    );
  }

  Widget buildTwitter(dynamic data, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            '  ${isMyProfile == true ? viewModel.readCache('twitter') : data.twitter ?? '-'}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          ),
        ),
        FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget buildCity(dynamic data, BuildContext context) {
    return buildProfileRow(
      context,
      LocaleKeys.home_profile_project_city,
      '${isMyProfile == true ? viewModel.readCache('city') : data.city}',
      FontAwesomeIcons.city,
    );
  }

  Widget buildFaculty(dynamic data, BuildContext context) {
    return buildProfileRow(
      context,
      LocaleKeys.sign_up_faculty,
      '${isMyProfile == true ? viewModel.readCache('faculty') : data.faculty}',
      FontAwesomeIcons.school,
    );
  }

  Widget buildUniversity(dynamic data, BuildContext context) {
    return buildProfileRow(
      context,
      LocaleKeys.home_profile_project_university,
      '${isMyProfile == true ? viewModel.readCache('university') : data.university}',
      FontAwesomeIcons.university,
    );
  }

  Widget buildProfileRow(
      BuildContext context, String title, String titleText, IconData icon) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                AutoSizeText(
                  title.locale + ': ',
                  style: context.textTheme.headline6!.copyWith(
                      color: context.colorScheme.onBackground,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: AutoSizeText(
                    titleText,
                    style: context.textTheme.subtitle1!
                        .copyWith(color: context.colorScheme.onBackground),
                  ),
                ),
              ],
            ),
          ),
          FaIcon(
            icon,
            color: context.colorScheme.primary,
          )
        ],
      ),
    );
  }

  Widget buildFullname(dynamic data, BuildContext context) {
    return buildProfileImageAndName(
        context,
        isMyProfile == true
            ? '${viewModel.readCache('first_name')} ${viewModel.readCache('last_name')}'
            : '${data.first_name} ${data.last_name}');
  }

  Widget buildProfileImageAndName(BuildContext context, String name) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: context.dynamicHeight(0.07)),
          padding: EdgeInsets.only(top: context.dynamicHeight(0.05)),
          decoration: BoxDecoration(
            borderRadius: context.normalBorderRadius,
            border: Border.all(color: context.colorScheme.primary),
          ),
          child: Center(
            child: AutoSizeText(
              name,
              style: context.textTheme.headline4!.copyWith(
                  color: context.colorScheme.onBackground,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CircleAvatar(
          radius: context.dynamicHeight(0.06),
          backgroundImage: NetworkImage(''.customHighProfileImage),
        ),
      ],
    );
  }

  Divider get buildDivider => Divider();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        // ignore: unnecessary_null_comparison
        text: LocaleKeys.home_profile_profile,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.background),
      ),
      centerTitle: false,
      backgroundColor: context.colorScheme.primary,
      iconTheme: IconThemeData(color: context.colorScheme.background),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: FaIcon(FontAwesomeIcons.edit),
      //   )
      // ],
    );
  }
}
