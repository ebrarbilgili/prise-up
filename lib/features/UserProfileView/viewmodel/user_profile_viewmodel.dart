import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teammate/core/base/viewmodel/base_viewmodel.dart';
import 'package:teammate/features/UserProfileView/model/user_profile_model.dart';
import 'package:teammate/features/UserProfileView/service/user_profile_service.dart';
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
}
