import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/app.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../../core/widgets/LocaleText/locale_text.dart';
import '../../RegisterUserView/service/register_user_service.dart';
import '../constant/widget/sign_up_button.dart';
import '../viewmodel/sign_up_viewmodel.dart';

class SignUpView extends StatelessWidget {
  SignUpView({
    Key? key,
    required this.email,
    required this.password,
    required this.password2,
  }) : super(key: key);

  final String email;
  final String password;
  final String password2;

  final viewModel = SignUpViewModel(
    registerUserService: RegisterUserService(
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
              buildCityField(context),
              buildTwitterField(context),
              buildLinkedinField(context),
              buildPhoneField(context),
              SignUpButtonWidget(
                viewModel: viewModel,
                email: email,
                password: password,
                password2: password2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPhoneField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingLow,
      child: TextFormField(
        controller: viewModel.phoneController,
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
          LocaleKeys.sign_up_university.locale,
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
