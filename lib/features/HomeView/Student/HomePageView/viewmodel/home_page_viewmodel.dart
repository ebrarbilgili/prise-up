import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/home_page_model.dart';
import '../service/home_page_service.dart';

part 'home_page_viewmodel.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store {
  HomePageProjectService homePageProjectService;

  @observable
  List<GetProjectModel> projectList = [];
  _HomePageViewModelBase({required this.homePageProjectService}) {
    getProjects();
  }

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @action
  Future<void> getProjects() async {
    projectList = await homePageProjectService.fetcProjects();
  }

  @action
  Future<void> onRefresh() async {
    await getProjects();
  }
}
