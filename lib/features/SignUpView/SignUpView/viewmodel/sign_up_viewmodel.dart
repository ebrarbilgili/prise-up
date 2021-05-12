import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/sign_up_model.dart';
import '../service/sign_up_service.dart';

part 'sign_up_viewmodel.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  SignUpService signUpService;

  _SignUpViewModelBase({required this.signUpService});

  final formKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final universityController = TextEditingController();
  final facultyController = TextEditingController();

  @action
  Future onPressedSignUp(int userId) async {
    return await signUpService.postSignUp(SignUpModel(
      first_name: firstnameController.text,
      last_name: lastnameController.text,
      university: universityController.text,
      faculty: facultyController.text,
      user: userId,
    ));
  }
}
