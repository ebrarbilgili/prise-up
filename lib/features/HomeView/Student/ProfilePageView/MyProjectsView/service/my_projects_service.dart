import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../../../core/constants/shared/shared_prefs_constant.dart';
import '../model/my_projects_model.dart';

class MyProjectsService {
  final Dio service;

  MyProjectsService({required this.service});

  Future<List<MyProjectsModel>> fetchMyProjects() async {
    final response = await service.get(
        '/api/myprojects/?userProfile=${SharedPreferencesConstant.instance.getStringValue('id')}');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => MyProjectsModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  // INetworkManager manager = NetworkManager(
  //   options: BaseOptions(baseUrl: AppConstants.BASE_URL),
  //   fileManager: LocalPreferences(),
  //   isEnableLogger: true,
  // );

  // Future<List<MyProjectsModel>> fetchMyProjects() async {
  //   final response = await manager.send(
  //     '/api/myprojects/?userProfile=${SharedPreferencesConstant.instance.getStringValue('id')}',
  //     expiration: Duration(seconds: 1),
  //     parseModel: MyProjectsModel(),
  //     method: RequestType.GET,
  //   );
  //   return response.data ?? [];
  // }
}
