import 'dart:io';

import 'package:dio/dio.dart';

import '../model/login_model.dart';

class LoginService {
  final Dio service;

  LoginService({required this.service});

  Future loginService(PostLoginModel loginModel) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'email': loginModel.email,
      'password': loginModel.password,
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
      '/api/login/',
      options: options,
      data: data,
    );

    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      return response.data;
    } else if (response.statusCode == HttpStatus.unauthorized) {
      print(response.data);
      return false;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
// ebrarbilgili@outlook.com
