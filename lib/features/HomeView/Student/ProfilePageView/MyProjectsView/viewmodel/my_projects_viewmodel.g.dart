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

  final _$isLoadingAtom = Atom(name: '_MyProjectsViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadedAsyncAction =
      AsyncAction('_MyProjectsViewModelBase.isLoaded');

  @override
  Future<void> isLoaded() {
    return _$isLoadedAsyncAction.run(() => super.isLoaded());
  }

  final _$onPressedFetchMyPojectAsyncAction =
      AsyncAction('_MyProjectsViewModelBase.onPressedFetchMyPoject');

  @override
  Future<void> onPressedFetchMyPoject() {
    return _$onPressedFetchMyPojectAsyncAction
        .run(() => super.onPressedFetchMyPoject());
  }

  @override
  String toString() {
    return '''
myProjectsModel: ${myProjectsModel},
isLoading: ${isLoading}
    ''';
  }
}
