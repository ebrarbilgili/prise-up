// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyProjectsViewModel on _MyProjectsViewModelBase, Store {
  final _$myProjectsModelAtom =
      Atom(name: '_MyProjectsViewModelBase.myProjectsModel');

  @override
  List<MyProjectsModel> get myProjectsModel {
    _$myProjectsModelAtom.reportRead();
    return super.myProjectsModel;
  }

  @override
  set myProjectsModel(List<MyProjectsModel> value) {
    _$myProjectsModelAtom.reportWrite(value, super.myProjectsModel, () {
      super.myProjectsModel = value;
    });
  }

  final _$onPressedFetchMyPojectAsyncAction =
      AsyncAction('_MyProjectsViewModelBase.onPressedFetchMyPoject');

  @override
  Future<List<MyProjectsModel>> onPressedFetchMyPoject() {
    return _$onPressedFetchMyPojectAsyncAction
        .run(() => super.onPressedFetchMyPoject());
  }

  final _$onRefreshAsyncAction =
      AsyncAction('_MyProjectsViewModelBase.onRefresh');

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  @override
  String toString() {
    return '''
myProjectsModel: ${myProjectsModel}
    ''';
  }
}
