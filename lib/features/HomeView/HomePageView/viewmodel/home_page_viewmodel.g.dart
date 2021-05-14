// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  final _$projectListAtom = Atom(name: '_HomePageViewModelBase.projectList');

  @override
  List<GetProjectModel> get projectList {
    _$projectListAtom.reportRead();
    return super.projectList;
  }

  @override
  set projectList(List<GetProjectModel> value) {
    _$projectListAtom.reportWrite(value, super.projectList, () {
      super.projectList = value;
    });
  }

  final _$getProjectsAsyncAction =
      AsyncAction('_HomePageViewModelBase.getProjects');

  @override
  Future<void> getProjects() {
    return _$getProjectsAsyncAction.run(() => super.getProjects());
  }

  final _$onRefreshAsyncAction =
      AsyncAction('_HomePageViewModelBase.onRefresh');

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  @override
  String toString() {
    return '''
projectList: ${projectList}
    ''';
  }
}
