import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/shared/shared_prefs_constant.dart';
import '../model/user_profile_model.dart';

class UserProfileService {
  final Dio service;
  UserProfileService({required this.service});

  Future<List<UserProfileModel>> fetchUserProfile() async {
    final response = await service.get(
        '/api/users/?id=${SharedPreferencesConstant.instance.getStringValue('id')}');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => UserProfileModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}
