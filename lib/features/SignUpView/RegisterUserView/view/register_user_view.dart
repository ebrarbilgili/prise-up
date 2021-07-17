import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/app.dart';
import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../../../core/widgets/LocaleText/locale_text.dart';
import '../constant/widget/sign_up_button.dart';
import '../service/register_user_service.dart';
import '../viewmodel/register_user_viewmodel.dart';

class RegisterUserView extends StatelessWidget {
  RegisterUserView({Key? key}) : super(key: key);

  final viewModel = RegisterUserViewModel(
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
              buildEmailField(context),
              buildPasswordField(context),
              buildConfirmPasswordField(context),
              buildRegisterUserButton
            ],
          ),
        ),
      ),
    );
  }

  Align get buildRegisterUserButton {
    return Align(
      alignment: Alignment.centerRight,
      child: RegisterUserButton(viewModel: viewModel),
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
          var regex = RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\.edu\.[a-zA-Z0-9._%+-]+$');
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
