import 'package:dio/dio.dart';
import 'package:teammate/core/constants/app.dart';
import 'package:teammate/core/constants/shared/shared_prefs_constant.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/model/my_projects_model.dart';
import 'package:vexana/vexana.dart';

class MyProjectsService {
  INetworkManager manager = NetworkManager(
    options: BaseOptions(baseUrl: AppConstants.BASE_URL),
    fileManager: LocalPreferences(),
    isEnableLogger: true,
  );

  Future<List<MyProjectsModel>> fetchMyProjects() async {
    final response = await manager.send(
      '/api/myprojects/?userProfile=${SharedPreferencesConstant.instance.getStringValue('id')}',
      expiration: Duration(seconds: 1),
      parseModel: MyProjectsModel(),
      method: RequestType.GET,
    );
    return response.data ?? [];
  }
}
