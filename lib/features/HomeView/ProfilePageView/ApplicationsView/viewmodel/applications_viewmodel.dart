import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../model/applications_model.dart';
import '../service/applications_service.dart';
part 'applications_viewmodel.g.dart';

class ApplicationsViewModel = _ApplicationsViewModelBase
    with _$ApplicationsViewModel;

abstract class _ApplicationsViewModelBase with Store {
  ApplicationsService service;

  _ApplicationsViewModelBase({required this.service}) {
    fetchMyApplications();
  }

  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @observable
  List<AppliedModel> applicationsList = [];

  @action
  Future<List<AppliedModel>> fetchMyApplications() async {
    return applicationsList = await service.getMyApplications();
  }

  @action
  Future<void> onRefresh() async {
    await fetchMyApplications();
  }
}
