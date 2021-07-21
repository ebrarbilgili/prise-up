import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/register_model.dart';
import '../service/register_service.dart';

part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  RegisterUserService registerUserService;

  _RegisterViewModelBase({required this.registerUserService});

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final universityController = TextEditingController();
  final facultyController = TextEditingController();
  final cityController = TextEditingController();
  final twitterController = TextEditingController();
  final linkedinController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();

  @action
  Future onPressedRegisterUser(int account_type) async {
    return await registerUserService.postRegisterUser(
      PostRegisterUserModel(
        email: emailController.text,
        // account_type: account_type,
        first_name: firstNameController.text,
        last_name: lastNameController.text,
        university: universityController.text,
        faculty: account_type == 0 ? facultyController.text : 'business acount',
        city: cityController.text,
        twitter: twitterController.text,
        linkedin: linkedinController.text,
        phone: phoneController.text,
        password: passwordController.text,
        password2: password2Controller.text,
      ),
      account_type,
    );
  }
}
