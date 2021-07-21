// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyProjectsDetailsViewModel on _MyProjectsDetailsViewModelBase, Store {
  final _$applianceListAtom =
      Atom(name: '_MyProjectsDetailsViewModelBase.applianceList');

  @override
  List<MyProjectsDetailsModel> get applianceList {
    _$applianceListAtom.reportRead();
    return super.applianceList;
  }

  @override
  set applianceList(List<MyProjectsDetailsModel> value) {
    _$applianceListAtom.reportWrite(value, super.applianceList, () {
      super.applianceList = value;
    });
  }

  final _$fetchAppliancesAsyncAction =
      AsyncAction('_MyProjectsDetailsViewModelBase.fetchAppliances');

  @override
  Future<List<MyProjectsDetailsModel>> fetchAppliances() {
    return _$fetchAppliancesAsyncAction.run(() => super.fetchAppliances());
  }

  final _$deleteProjectAsyncAction =
      AsyncAction('_MyProjectsDetailsViewModelBase.deleteProject');

  @override
  Future<dynamic> deleteProject(int projectID) {
    return _$deleteProjectAsyncAction.run(() => super.deleteProject(projectID));
  }

  final _$onRefreshAsyncAction =
      AsyncAction('_MyProjectsDetailsViewModelBase.onRefresh');

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  @override
  String toString() {
    return '''
applianceList: ${applianceList}
    ''';
  }
}
