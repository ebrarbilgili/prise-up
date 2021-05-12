import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/login_model.dart';
import '../service/login_service.dart';

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  LoginService loginService;

  _LoginViewModelBase({required this.loginService});

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @action
  Future onPressedLogin() async {
    return await loginService.loginService(PostLoginModel(
      email: emailController.text,
      password: passwordController.text,
    ));
  }
}
