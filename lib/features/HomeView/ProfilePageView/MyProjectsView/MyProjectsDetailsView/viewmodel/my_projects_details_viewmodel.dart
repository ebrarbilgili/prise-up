import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/model/my_projects_details_model.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/MyProjectsDetailsView/service/my_projects_details_service.dart';

part 'my_projects_details_viewmodel.g.dart';

class MyProjectsDetailsViewModel = _MyProjectsDetailsViewModelBase
    with _$MyProjectsDetailsViewModel;

abstract class _MyProjectsDetailsViewModelBase with Store {
  MyProjectsDetailsService service;
  int projectID;

  _MyProjectsDetailsViewModelBase({
    required this.service,
    required this.projectID,
  }) {
    fetchAppliances();
  }
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  @observable
  List<MyProjectsDetailsModel> applianceList = [];

  @action
  Future<List<MyProjectsDetailsModel>> fetchAppliances() async {
    return applianceList = await service.fetchMyProjectsDetail(projectID);
  }

  @action
  Future<void> onRefresh() async {
    await fetchAppliances();
  }
}
