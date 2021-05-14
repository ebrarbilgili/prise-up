import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teammate/features/HomeView/HomePageView/DetailsView/model/details_model.dart';

class PostApplyService {
  final Dio service;

  PostApplyService({required this.service});

  Future postApply(PostApplyModel model) async {
    final headers = {'Content-type': 'application/json'};

    final data = {
      'userProfile': model.userProfile,
      'project': model.project,
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
      '/api/applied/',
      options: options,
      data: data,
    );

    if (response.statusCode == HttpStatus.created) {
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
