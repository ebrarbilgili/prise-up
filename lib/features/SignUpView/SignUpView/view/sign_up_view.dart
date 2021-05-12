import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/app.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../../core/widgets/LocaleText/locale_text.dart';
import '../constant/widget/sign_up_button.dart';
import '../service/sign_up_service.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class SignUpView extends StatelessWidget {
  SignUpView({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final int userId;

  final viewModel = SignUpViewModel(
    signUpService: SignUpService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: context.horizontalPaddingLow,
        child: Form(
          key: viewModel.formKey,
          child: ListView(
            children: [
              buildFirstNameField(context),
              buildLastNameField(context),
              buildUniversityField(context),
              buildFacultyField(context),
              SignUpButtonWidget(viewModel: viewModel, userId: userId)
            ],
          ),
        ),
      ),
    );
  }

  Padding buildFacultyField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.facultyController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_faculty.locale,
          FontAwesomeIcons.chalkboard,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_valid_username.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildUniversityField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.universityController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_university.locale,
          FontAwesomeIcons.school,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_valid_username.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildLastNameField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.lastnameController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_last_name.locale,
          FontAwesomeIcons.solidUser,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_valid_username.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildFirstNameField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.firstnameController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_first_name.locale,
          FontAwesomeIcons.solidUser,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_valid_username.locale;
          }
          return null;
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: LocaleText(
        text: LocaleKeys.sign_up_sign_up.locale,
        style: context.textTheme.headline6!
            .copyWith(color: context.colorScheme.primaryVariant),
      ),
      centerTitle: false,
    );
  }

  InputDecoration buildTextFieldDecoration(
      BuildContext context, String hintText, IconData iconData) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      hintText: hintText,
      icon: FaIcon(
        iconData,
        color: context.colorScheme.secondary,
      ),
    );
  }
}
