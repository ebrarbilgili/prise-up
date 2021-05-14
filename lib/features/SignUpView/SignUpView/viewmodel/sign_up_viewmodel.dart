import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../RegisterUserView/model/register_user_model.dart';
import '../../RegisterUserView/service/register_user_service.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  RegisterUserService registerUserService;

  _SignUpViewModelBase({required this.registerUserService});

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final universityController = TextEditingController();
  final facultyController = TextEditingController();
  final cityController = TextEditingController();

  @action
  Future onPressedRegisterUser(
      String email, String password, String password2) async {
    return await registerUserService.postRegisterUser(PostRegisterUserModel(
      email: email,
      first_name: firstNameController.text,
      last_name: lastNameController.text,
      university: universityController.text,
      faculty: facultyController.text,
      city: cityController.text,
      password: password,
      password2: password2,
    ));
  }
}
