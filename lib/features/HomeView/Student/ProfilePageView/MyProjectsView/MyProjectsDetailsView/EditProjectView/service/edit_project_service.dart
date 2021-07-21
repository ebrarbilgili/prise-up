import 'dart:io';

import 'package:dio/dio.dart';

import '../../../model/my_projects_model.dart';

class EditProjectService {
  final Dio service;
  EditProjectService({required this.service});

  Future editProject(MyProjectsModel model, int projectID) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'userProfile': model.userProfile,
      'title': model.title,
      'subtitle': model.subtitle,
      'desc': model.desc,
      'university': model.university,
      'city': model.city,
    };

    bool Function(int?)? validateStatus = (status) {
      return status! <= 500;
    };

    final options = Options(
      headers: headers,
      followRedirects: false,
      validateStatus: validateStatus,
    );

    final response = await service.put(
      '/api/projects/?id=${model.id}',
      data: data,
      options: options,
    );

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
