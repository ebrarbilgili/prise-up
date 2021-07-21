import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/constants/widget/ProgressIndicator/circular_progress_indicator.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/widgets/LocaleText/locale_text.dart';
import '../../HomeView/Student/HomePageView/model/home_page_model.dart';
import '../../HomeView/Student/ProfilePageView/ApplicationsView/model/applications_model.dart';
import '../../HomeView/Student/ProfilePageView/MyProjectsView/MyProjectsDetailsView/model/my_projects_details_model.dart';
import '../model/user_profile_model.dart';
import '../service/user_profile_service.dart';
import '../viewmodel/user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({
    Key? key,
    this.model,
    this.getProjectModel,
    this.appliedModel,
  }) : super(key: key);

  final MyProjectsDetailsModel? model;
  final GetProjectModel? getProjectModel;
  final AppliedModel? appliedModel;

  final viewModel = UserProfileViewModel(
    service: UserProfileService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Observer(
        builder: (_) {
          return buildListView(context);
        },
      ),
    );
  }

  Padding buildListView(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: ListView.builder(
        itemCount: viewModel.userProfileList.length,
        itemBuilder: (context, index) {
          return FutureBuilder<List<UserProfileModel>>(
              future: viewModel.fetchUserProfile(),
              builder: (context, snapshot) {
                final data = viewModel.userProfileList[index];
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildFullname(data, context),
                      buildUniversity(data, context),
                      buildFaculty(data, context),
                      buildCity(data, context),
                      buildContactRow(context),
                      buildDivider,
                      buildTwitter(data, context),
                      buildDivider,
                      buildLinkedin(data, context),
                      buildDivider,
                      buildPhone(context, data),
                      buildDivider,
                      buildEmail(context, data),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicatorWidget(),
                  );
                } else if (!snapshot.hasData) {
                  return AutoSizeText('Error occured');
                } else {
                  throw Exception();
                }
              });
        },
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

  Row buildEmail(BuildContext context, UserProfileModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        model != null
            ? AutoSizeText(
                '  ${model!.applyUserProfile!.email ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : getProjectModel != null
                ? AutoSizeText(
                    '  ${getProjectModel!.userProfile!.email ?? '-'}',
                    style: context.textTheme.headline6!
                        .copyWith(color: context.colorScheme.onBackground),
                  )
                : appliedModel != null
                    ? AutoSizeText(
                        '  ${appliedModel!.project!.userProfile!.email ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      )
                    : AutoSizeText(
                        '  ${data.email ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      ),
        FaIcon(
          FontAwesomeIcons.solidEnvelope,
          color: context.colorScheme.primary,
        ),
      ],
    );
  }

  Row buildPhone(BuildContext context, UserProfileModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        model != null
            ? AutoSizeText(
                '  ${model!.applyUserProfile!.phone ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : getProjectModel != null
                ? AutoSizeText(
                    '  ${getProjectModel!.userProfile!.phone ?? '-'}',
                    style: context.textTheme.headline6!
                        .copyWith(color: context.colorScheme.onBackground),
                  )
                : appliedModel != null
                    ? AutoSizeText(
                        '  ${appliedModel!.project!.userProfile!.phone ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      )
                    : AutoSizeText(
                        '  ${data.phone ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      ),
        FaIcon(
          FontAwesomeIcons.phone,
          color: context.colorScheme.primary,
        ),
      ],
    );
  }

  Row buildLinkedin(UserProfileModel data, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        model != null
            ? AutoSizeText(
                '  ${model!.applyUserProfile!.linkedIn ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : getProjectModel != null
                ? AutoSizeText(
                    '  ${getProjectModel!.userProfile!.linkedIn ?? '-'}',
                    style: context.textTheme.headline6!
                        .copyWith(color: context.colorScheme.onBackground),
                  )
                : appliedModel != null
                    ? AutoSizeText(
                        '  ${appliedModel!.project!.userProfile!.linkedIn ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      )
                    : AutoSizeText(
                        '  ${data.linkedIn ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      ),
        FaIcon(
          FontAwesomeIcons.linkedin,
          color: Colors.blue.shade900,
        ),
      ],
    );
  }

  Row buildTwitter(UserProfileModel data, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        model != null
            ? AutoSizeText(
                '  ${model!.applyUserProfile!.twitter ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : getProjectModel != null
                ? AutoSizeText(
                    '  ${getProjectModel!.userProfile!.twitter ?? '-'}',
                    style: context.textTheme.headline6!
                        .copyWith(color: context.colorScheme.onBackground),
                  )
                : appliedModel != null
                    ? AutoSizeText(
                        '  ${appliedModel!.project!.userProfile!.twitter ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      )
                    : AutoSizeText(
                        '  ${data.twitter ?? '-'}',
                        style: context.textTheme.headline6!
                            .copyWith(color: context.colorScheme.onBackground),
                      ),
        FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget buildCity(UserProfileModel data, BuildContext context) {
    return model != null
        ? buildProfileRow(
            context,
            LocaleKeys.home_profile_project_city,
            '${model!.applyUserProfile!.city}',
            FontAwesomeIcons.city,
          )
        : getProjectModel != null
            ? buildProfileRow(
                context,
                LocaleKeys.home_profile_project_city,
                '${getProjectModel!.city ?? '-'}',
                FontAwesomeIcons.city,
              )
            : appliedModel != null
                ? buildProfileRow(
                    context,
                    LocaleKeys.home_profile_project_city,
                    '  ${appliedModel!.applyUserProfile!.city ?? '-'}',
                    FontAwesomeIcons.city,
                  )
                : buildProfileRow(
                    context,
                    LocaleKeys.home_profile_project_city,
                    '${data.city}',
                    FontAwesomeIcons.city,
                  );
  }

  Widget buildFaculty(UserProfileModel data, BuildContext context) {
    return model != null
        ? buildProfileRow(
            context,
            LocaleKeys.sign_up_faculty,
            '${model!.applyUserProfile!.faculty}',
            FontAwesomeIcons.school,
          )
        : getProjectModel != null
            ? buildProfileRow(
                context,
                LocaleKeys.sign_up_faculty,
                '${getProjectModel!.userProfile!.faculty ?? '-'}',
                FontAwesomeIcons.school,
              )
            : appliedModel != null
                ? buildProfileRow(
                    context,
                    LocaleKeys.sign_up_faculty,
                    '  ${appliedModel!.applyUserProfile!.faculty ?? '-'}',
                    FontAwesomeIcons.school,
                  )
                : buildProfileRow(
                    context,
                    LocaleKeys.sign_up_faculty,
                    '${data.faculty}',
                    FontAwesomeIcons.school,
                  );
  }

  Widget buildUniversity(UserProfileModel data, BuildContext context) {
    return model != null
        ? buildProfileRow(
            context,
            LocaleKeys.home_profile_project_university,
            '${model!.applyUserProfile!.university}',
            FontAwesomeIcons.university,
          )
        : getProjectModel != null
            ? buildProfileRow(
                context,
                LocaleKeys.home_profile_project_university,
                '${getProjectModel!.university ?? '-'}',
                FontAwesomeIcons.university,
              )
            : appliedModel != null
                ? buildProfileRow(
                    context,
                    LocaleKeys.home_profile_project_university,
                    '${appliedModel!.applyUserProfile!.university ?? '-'}',
                    FontAwesomeIcons.university,
                  )
                : buildProfileRow(
                    context,
                    LocaleKeys.home_profile_project_university,
                    '${data.university}',
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
          Row(
            children: [
              AutoSizeText(
                title.locale + ': ',
                style: context.textTheme.headline6!.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w500),
              ),
              AutoSizeText(
                titleText,
                style: context.textTheme.subtitle1!
                    .copyWith(color: context.colorScheme.onBackground),
              ),
            ],
          ),
          FaIcon(
            icon,
            color: context.colorScheme.primary,
          )
        ],
      ),
    );
  }

  Widget buildFullname(UserProfileModel data, BuildContext context) {
    return model != null
        ? buildProfileImageAndName(context,
            '${model!.applyUserProfile!.first_name} ${model!.applyUserProfile!.last_name}')
        : getProjectModel != null
            ? buildProfileImageAndName(context,
                '${getProjectModel!.userProfile!.first_name ?? '-'} ${getProjectModel!.userProfile!.last_name ?? '-'}')
            : appliedModel != null
                ? buildProfileImageAndName(context,
                    '${appliedModel!.applyUserProfile!.first_name ?? '-'} ${appliedModel!.applyUserProfile!.last_name ?? '-'}')
                : buildProfileImageAndName(
                    context, '${data.first_name} ${data.last_name}');
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
        text: LocaleKeys.home_user_profile_my_profile,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.background),
      ),
      centerTitle: false,
      backgroundColor: context.colorScheme.primary,
      iconTheme: IconThemeData(color: context.colorScheme.background),
      actions: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.edit),
        )
      ],
    );
  }
}
