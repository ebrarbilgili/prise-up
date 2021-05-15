import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/model/my_projects_model.dart';
import 'package:teammate/features/HomeView/ProfilePageView/MyProjectsView/service/my_projects_service.dart';
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
  @action
  Future<List<MyProjectsModel>> onPressedFetchMyPoject() async {
    return myProjectsModel = await service.fetchMyProjects();
  }

  @action
  Future<void> onRefresh() async {
    await onPressedFetchMyPoject();
  }
}
