import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../model/home_page_model.dart';
import '../service/home_page_service.dart';

part 'home_page_viewmodel.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  BusinessHomePageProjectService businessHomePageProjectService;

  @observable
  List<BusinessGetProjectModel> projectsForInvestorsList = [];
  @observable
  bool isLoading = true;

  _HomePageViewModelBase({required this.businessHomePageProjectService}) {
    getProjectsForInvestors();
  }

  @action
  Future<void> isLoaded() async {
    isLoading = !isLoading;
  }

  @action
  Future<void> getProjectsForInvestors() async {
    await isLoaded();
    projectsForInvestorsList =
        await businessHomePageProjectService.fetchProjectsForInvestors();
    await isLoaded();
  }
}
