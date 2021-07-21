import 'dart:io';

import 'package:dio/dio.dart';

import '../model/create_project_model.dart';

class CreateProjectService {
  final Dio service;

  CreateProjectService({required this.service});

  Future createProject(CreateProjectModel model, int userID) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'title': model.title,
      'subtitle': model.subtitle,
      'desc': model.desc,
      'university': model.university,
      'city': model.city,
      'userProfile': userID,
    };

    bool Function(int?)? validateStatus = (status) {
      return status! <= 500;
    };

    final options = Options(
      headers: headers,
      followRedirects: false,
      validateStatus: validateStatus,
    );

    final response =
        await service.post('/api/projects/', options: options, data: data);

    if (response.statusCode == HttpStatus.created) {
      print(response.data);
      return response.data;
    } else if (response.statusCode == HttpStatus.unauthorized) {
      print(response.data);
      return false;
    } else {
      throw Exception();
    }
  }
}
