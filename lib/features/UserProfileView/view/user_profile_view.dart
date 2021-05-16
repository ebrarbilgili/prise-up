import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:teammate/core/constants/app.dart';
import 'package:teammate/core/lang/locale_key.g.dart';
import 'package:teammate/core/widgets/LocaleText/locale_text.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/model/my_projects_details_model.dart';
import 'package:teammate/features/UserProfileView/model/user_profile_model.dart';
import 'package:teammate/features/UserProfileView/service/user_profile_service.dart';
import 'package:teammate/features/UserProfileView/viewmodel/user_profile_viewmodel.dart';

class UserProfileView extends StatelessWidget {
  UserProfileView({Key? key, this.model}) : super(key: key);

  final MyProjectsDetailsModel? model;

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
          final data = viewModel.userProfileList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFullname(data, context),
              buildUniversity(data, context),
              buildFaculty(data, context),
              buildCity(data, context),
              buildDivider,
              buildTwitter(data, context),
              buildDivider,
              buildLinkedin(data, context),
              buildDivider,
              buildPhone(context, data),
            ],
          );
        },
      ),
    );
  }

  Row buildPhone(BuildContext context, UserProfileModel data) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.phone,
          color: context.colorScheme.primary,
        ),
        model != null
            ? AutoSizeText(
                ' /${model!.applyUserProfile!.phone ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : AutoSizeText(
                ' /${data.phone ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              ),
      ],
    );
  }

  Row buildLinkedin(UserProfileModel data, BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.linkedin,
          color: Colors.blue.shade900,
        ),
        model != null
            ? AutoSizeText(
                ' /${model!.applyUserProfile!.linkedIn ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : AutoSizeText(
                ' /${data.linkedIn ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              ),
      ],
    );
  }

  Row buildTwitter(UserProfileModel data, BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
        model != null
            ? AutoSizeText(
                ' /${model!.applyUserProfile!.twitter ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              )
            : AutoSizeText(
                ' /${data.twitter ?? '-'}',
                style: context.textTheme.headline6!
                    .copyWith(color: context.colorScheme.onBackground),
              ),
      ],
    );
  }

  AutoSizeText buildCity(UserProfileModel data, BuildContext context) {
    return model != null
        ? AutoSizeText(
            '${model!.applyUserProfile!.city}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          )
        : AutoSizeText(
            '${data.city}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          );
  }

  AutoSizeText buildFaculty(UserProfileModel data, BuildContext context) {
    return model != null
        ? AutoSizeText(
            '${model!.applyUserProfile!.faculty}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          )
        : AutoSizeText(
            '${data.faculty}',
            style: context.textTheme.headline6!
                .copyWith(color: context.colorScheme.onBackground),
          );
  }

  AutoSizeText buildUniversity(UserProfileModel data, BuildContext context) {
    return model != null
        ? AutoSizeText(
            '${model!.applyUserProfile!.university}',
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.onBackground),
          )
        : AutoSizeText(
            '${data.university}',
            style: context.textTheme.headline5!
                .copyWith(color: context.colorScheme.onBackground),
          );
  }

  AutoSizeText buildFullname(UserProfileModel data, BuildContext context) {
    return model != null
        ? AutoSizeText(
            '${model!.applyUserProfile!.first_name} ${model!.applyUserProfile!.last_name}',
            style: context.textTheme.headline4!.copyWith(
                color: context.colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          )
        : AutoSizeText(
            '${data.first_name} ${data.last_name}',
            style: context.textTheme.headline4!.copyWith(
                color: context.colorScheme.onBackground,
                fontWeight: FontWeight.bold),
          );
  }

  Divider get buildDivider => Divider();

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        text: LocaleKeys.home_user_profile_my_profile,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.onBackground),
      ),
      centerTitle: false,
    );
  }
}
