import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/register_user_model.dart';
import '../service/register_user_service.dart';

part 'register_user_viewmodel.g.dart';

class RegisterUserViewModel = _RegisterUserViewModelBase
    with _$RegisterUserViewModel;

abstract class _RegisterUserViewModelBase with Store {
  RegisterUserService registerUserService;

  _RegisterUserViewModelBase({required this.registerUserService});

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  @action
  Future onPressedRegisterUser() async {
    return await registerUserService.postRegisterUser(PostRegisterUserModel(
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    ));
  }
}
