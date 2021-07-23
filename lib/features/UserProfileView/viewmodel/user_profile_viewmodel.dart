import 'package:mobx/mobx.dart';

import '../../../core/constants/shared/shared_prefs_constant.dart';
import '../model/user_profile_model.dart';
import '../service/user_profile_service.dart';

part 'user_profile_viewmodel.g.dart';

class UserProfileViewModel = _UserProfileViewModelBase
    with _$UserProfileViewModel;

abstract class _UserProfileViewModelBase with Store {
  final UserProfileService service;

  _UserProfileViewModelBase({required this.service}) {
    fetchUserProfile();
  }

  @observable
  List<UserProfileModel> userProfileList = [];

  @action
  Future<List<UserProfileModel>> fetchUserProfile() async {
    return userProfileList = await service.fetchUserProfile();
  }

  @action
  String readCache(String key) {
    return SharedPreferencesConstant.instance.getStringValue(key) ?? 'Error';
  }
}
