import 'dart:io';

import 'package:dio/dio.dart';

import '../model/sign_up_model.dart';

class SignUpService {
  final Dio service;

  SignUpService({required this.service});

  Future postSignUp(SignUpModel model) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'first_name': model.first_name,
      'last_name': model.last_name,
      'university': model.university,
      'faculty': model.faculty,
      'city': model.city,
      'twitter': model.twitter,
      'linkedIn': model.linkedIn,
      'phone': model.phone,
      'user': model.user
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
      '/api/user-profile/',
      options: options,
      data: data,
    );

    if (response.statusCode == HttpStatus.created) {
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
