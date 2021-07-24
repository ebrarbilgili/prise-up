import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../constants/widget/sign_up_button.dart';
import '../service/register_service.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    Key? key,
    required this.accountType,
  }) : super(key: key);

  final int accountType;

  final viewModel = RegisterViewModel(
    registerUserService: RegisterUserService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

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
      child: Form(
        key: viewModel.formKey,
        child: ListView(
          children: [
            buildEmailField(context),
            buildPasswordField(context),
            buildConfirmPasswordField(context),
            buildFirstNameField(context),
            buildLastNameField(context),
            buildUniversityField(context),
            accountType == 0 ? buildFacultyField(context) : SizedBox(),
            buildCityField(context),
            buildTwitterField(context),
            buildLinkedinField(context),
            buildPhoneField(context),
            SignUpButtonWidget(
              viewModel: viewModel,
              account_type: accountType,
            )
          ],
        ),
      ),
    );
  }

  Padding buildConfirmPasswordField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.password2Controller,
        obscureText: true,
        decoration: buildTextFieldDecoration(context,
            LocaleKeys.sign_up_password2.locale, FontAwesomeIcons.lock),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.login_button_valid_pass.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildPasswordField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.passwordController,
        obscureText: true,
        decoration: buildTextFieldDecoration(
            context, LocaleKeys.login_password.locale, FontAwesomeIcons.lock),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.login_button_valid_pass.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildEmailField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: buildTextFieldDecoration(context,
            LocaleKeys.sign_up_email.locale, FontAwesomeIcons.solidEnvelope),
        validator: (value) {
          // var regex = accountType == 0
          //     ?
          var regex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\.edu\.[a-zA-Z0-9._%+-]+$');
          // : RegExp(
          //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\.[a-zA-Z0-9._%+-]+\.[a-zA-Z0-9._%+-]+$');
          if (!regex.hasMatch(value.toString()) ||
              value == null ||
              value.isEmpty ||
              value == '') {
            return LocaleKeys.sign_up_valid_email.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildPhoneField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.phoneController,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_phone.locale,
          FontAwesomeIcons.phone,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildLinkedinField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.linkedinController,
        decoration: buildTextFieldDecoration(
          context,
          'LinkedIn',
          FontAwesomeIcons.linkedin,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildTwitterField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.twitterController,
        decoration: buildTextFieldDecoration(
          context,
          'Twitter',
          FontAwesomeIcons.twitter,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildCityField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.cityController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_city.locale,
          FontAwesomeIcons.chalkboard,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
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
            return LocaleKeys.sign_up_validation.locale;
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
          accountType == 0
              ? LocaleKeys.sign_up_university.locale
              : LocaleKeys.sign_up_business.locale,
          FontAwesomeIcons.school,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
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
        controller: viewModel.lastNameController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_last_name.locale,
          FontAwesomeIcons.solidUser,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
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
        controller: viewModel.firstNameController,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.sign_up_first_name.locale,
          FontAwesomeIcons.solidUser,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.sign_up_validation.locale;
          }
          return null;
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        LocaleKeys.sign_up_sign_up.locale,
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
