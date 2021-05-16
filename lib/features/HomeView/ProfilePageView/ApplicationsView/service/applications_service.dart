import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../model/applications_model.dart';

class ApplicationsService {
  final Dio service;
  ApplicationsService({required this.service});

  Future<List<AppliedModel>> getMyApplications() async {
    final response = await service.get(
        '/api/applied/?applyUserProfile=${SharedPreferencesConstant.instance.getStringValue('id')}');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => AppliedModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
