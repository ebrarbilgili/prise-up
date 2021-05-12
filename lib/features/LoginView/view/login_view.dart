import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app.dart';
import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/widgets/LocaleText/locale_text.dart';
import '../../SignUpView/RegisterUserView/view/register_user_view.dart';
import '../constant/widget/login_button.dart';
import '../service/login_service.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final viewModel = LoginViewModel(
    loginService: LoginService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL, method: 'POST')),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildForm(context),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildLogo, buildFieldsAndButtons(context)],
      ),
    );
  }

  Expanded buildFieldsAndButtons(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          buildEmailField(context),
          buildPasswordField(context),
          buildLoginButton(context),
          buildRegisterButton(context)
        ],
      ),
    );
  }

  Expanded get buildLogo {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(AppConstants.LOGO),
        ],
      ),
    );
  }

  TextButton buildRegisterButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigation.push(MaterialPageRoute(
          builder: (context) => RegisterUserView(),
        ));
      },
      child: LocaleText(
        text: LocaleKeys.login_register_btn,
      ),
    );
  }

  Padding buildEmailField(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextFormField(
        controller: viewModel.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: buildTextFieldDecoration(
          context,
          LocaleKeys.login_email.locale,
          FontAwesomeIcons.solidEnvelope,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.login_button_valid_email.locale;
          }
          return null;
        },
      ),
    );
  }

  Padding buildPasswordField(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
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

  Container buildLoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.dynamicHeight(0.06),
      margin: context.paddingNormal,
      child: LoginButton(viewModel: viewModel),
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
