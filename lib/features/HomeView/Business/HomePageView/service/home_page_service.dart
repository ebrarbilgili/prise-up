import 'dart:io';

import 'package:dio/dio.dart';

import '../model/home_page_model.dart';

class BusinessHomePageProjectService {
  final Dio service;

  BusinessHomePageProjectService({required this.service});

  Future<List<BusinessGetProjectModel>> fetchProjectsForInvestors() async {
    final response = await service.get('/api/investor-projects/');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => BusinessGetProjectModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
