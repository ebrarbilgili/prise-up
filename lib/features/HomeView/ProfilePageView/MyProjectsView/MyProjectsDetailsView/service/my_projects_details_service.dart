import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/my_projects_model.dart';
import '../model/my_projects_details_model.dart';

class MyProjectsDetailsService {
  final Dio service;
  MyProjectsDetailsService({required this.service});

  Future<List<MyProjectsDetailsModel>> fetchMyProjectsDetail(
      int projectID) async {
    final response = await service.get('/api/appliance/?project=$projectID');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => MyProjectsDetailsModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  Future deleteProject(int projectID) async {
    final response = await service.delete('/api/projects/?id=$projectID');

    if (response.statusCode == HttpStatus.noContent) {
      print(true);
      return response.data;
    }
    print(false);
    return false;
  }

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
      '/api/projects/?id=$projectID',
      data: data,
      options: options,
    );

    if (response.statusCode == HttpStatus.ok) {
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
