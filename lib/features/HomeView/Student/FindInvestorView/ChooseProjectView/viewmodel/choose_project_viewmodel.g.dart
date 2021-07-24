// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_project_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChooseProjectViewModel on _ChooseProjectViewModelBase, Store {
  final _$myProjectsModelAtom =
      Atom(name: '_ChooseProjectViewModelBase.myProjectsModel');

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

  final _$isLoadingAtom = Atom(name: '_ChooseProjectViewModelBase.isLoading');

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
      AsyncAction('_ChooseProjectViewModelBase.isLoaded');

  @override
  Future<void> isLoaded() {
    return _$isLoadedAsyncAction.run(() => super.isLoaded());
  }

  final _$onPressedFetchMyPojectAsyncAction =
      AsyncAction('_ChooseProjectViewModelBase.onPressedFetchMyPoject');

  @override
  Future<void> onPressedFetchMyPoject() {
    return _$onPressedFetchMyPojectAsyncAction
        .run(() => super.onPressedFetchMyPoject());
  }

  final _$chooseProjectAsyncAction =
      AsyncAction('_ChooseProjectViewModelBase.chooseProject');

  @override
  Future<dynamic> chooseProject(MyProjectsModel model, int userID) {
    return _$chooseProjectAsyncAction
        .run(() => super.chooseProject(model, userID));
  }

  final _$isChoosedProjectAsyncAction =
      AsyncAction('_ChooseProjectViewModelBase.isChoosedProject');

  @override
  Future<dynamic> isChoosedProject(MyProjectsModel model, int userID) {
    return _$isChoosedProjectAsyncAction
        .run(() => super.isChoosedProject(model, userID));
  }

  @override
  String toString() {
    return '''
myProjectsModel: ${myProjectsModel},
isLoading: ${isLoading}
    ''';
  }
}
