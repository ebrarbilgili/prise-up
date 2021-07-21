import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/my_projects_details_model.dart';
import '../service/my_projects_details_service.dart';

part 'my_projects_details_viewmodel.g.dart';

class MyProjectsDetailsViewModel = _MyProjectsDetailsViewModelBase
    with _$MyProjectsDetailsViewModel;

abstract class _MyProjectsDetailsViewModelBase with Store {
  MyProjectsDetailsService service;
  int projectID;

  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descController = TextEditingController();
  final universityController = TextEditingController();
  final cityController = TextEditingController();

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

//  @action
//   Future editProject(CreateProjectModel model,int userID,int projectID) async {
//     return await service.editProject(,userID,projectID);
//   }

  @action
  Future deleteProject(int projectID) async {
    return await service.deleteProject(projectID);
  }

  @action
  Future<void> onRefresh() async {
    await fetchAppliances();
  }
}
