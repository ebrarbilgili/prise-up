import 'package:dio/dio.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/constants/app.dart';
import '../model/home_page_model.dart';

class HomePageProjectService {
  // final Dio service;

  // HomePageProjectService({required this.service});

  // Future<List<GetProjectModel>> getProject() async {
  //   final response = await service.get('/api/projects/');

  //   if (response.statusCode == HttpStatus.ok) {
  //     final data = response.data;
  //     if (data is List) {
  //       return data.map((e) => GetProjectModel.fromJson(e)).toList();
  //     }
  //   }
  //   return [];
  // }

  INetworkManager manager = NetworkManager(
    options: BaseOptions(baseUrl: AppConstants.BASE_URL),
    fileManager: LocalPreferences(),
    isEnableLogger: true,
  );

  Future<List<GetProjectModel>> fetcProjects() async {
    final response = await manager.send(
      '/api/projects/',
      expiration: Duration(minutes: 10),
      parseModel: GetProjectModel(),
      method: RequestType.GET,
    );
    return response.data ?? [];
  }
}
