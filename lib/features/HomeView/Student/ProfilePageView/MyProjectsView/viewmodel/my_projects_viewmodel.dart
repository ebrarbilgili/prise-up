import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/my_projects_model.dart';
import '../service/my_projects_service.dart';

part 'my_projects_viewmodel.g.dart';

class MyProjectsViewModel = _MyProjectsViewModelBase with _$MyProjectsViewModel;

abstract class _MyProjectsViewModelBase with Store {
  MyProjectsService service;

  _MyProjectsViewModelBase({required this.service}) {
    onPressedFetchMyPoject();
  }

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @observable
  List<MyProjectsModel> myProjectsModel = [];
  @observable
  bool isLoading = true;

  @action
  Future<void> isLoaded() async {
    isLoading = !isLoading;
  }

  @action
  Future<void> onPressedFetchMyPoject() async {
    await isLoaded();
    myProjectsModel = await service.fetchMyProjects();
    await isLoaded();
  }
}
