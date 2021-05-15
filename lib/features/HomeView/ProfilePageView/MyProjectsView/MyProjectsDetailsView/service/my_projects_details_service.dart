import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/model/my_projects_details_model.dart';

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
}
