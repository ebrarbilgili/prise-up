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

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final universityController = TextEditingController();
  final facultyController = TextEditingController();
  final cityController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  @action
  Future onPressedRegisterUser() async {
    return await registerUserService.postRegisterUser(PostRegisterUserModel(
      email: emailController.text,
      first_name: firstNameController.text,
      last_name: lastNameController.text,
      university: universityController.text,
      faculty: facultyController.text,
      city: cityController.text,
      password: passwordController.text,
    ));
  }
}
