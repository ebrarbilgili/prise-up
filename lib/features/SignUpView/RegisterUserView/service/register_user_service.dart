import 'dart:io';

import 'package:dio/dio.dart';

import '../model/register_user_model.dart';

class RegisterUserService {
  final Dio service;

  RegisterUserService({required this.service});

  Future postRegisterUser(PostRegisterUserModel model) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'email': model.email,
      'first_name': model.first_name,
      'last_name': model.last_name,
      'university': model.university,
      'faculty': model.faculty,
      'city': model.city,
      'twitter': model.twitter,
      'linkedIn': model.linkedin,
      'phone': model.phone,
      'password': model.password,
      'password2': model.password2,
    };

    bool Function(int?)? validateStatus = (status) {
      return status! <= 500;
    };

    final options = Options(
      headers: headers,
      followRedirects: false,
      validateStatus: validateStatus,
    );

    final response = await service.post(
      '/api/register/',
      options: options,
      data: data,
    );

    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      return response.data;
    } else if (response.statusCode == HttpStatus.badRequest) {
      print(response.data);
      return false;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
