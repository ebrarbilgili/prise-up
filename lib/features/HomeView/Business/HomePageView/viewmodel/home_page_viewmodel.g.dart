// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  final _$projectsForInvestorsListAtom =
      Atom(name: '_HomePageViewModelBase.projectsForInvestorsList');

  @override
  List<BusinessGetProjectModel> get projectsForInvestorsList {
    _$projectsForInvestorsListAtom.reportRead();
    return super.projectsForInvestorsList;
  }

  @override
  set projectsForInvestorsList(List<BusinessGetProjectModel> value) {
    _$projectsForInvestorsListAtom
        .reportWrite(value, super.projectsForInvestorsList, () {
      super.projectsForInvestorsList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomePageViewModelBase.isLoading');

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

  final _$isLoadedAsyncAction = AsyncAction('_HomePageViewModelBase.isLoaded');

  @override
  Future<void> isLoaded() {
    return _$isLoadedAsyncAction.run(() => super.isLoaded());
  }

  final _$getProjectsForInvestorsAsyncAction =
      AsyncAction('_HomePageViewModelBase.getProjectsForInvestors');

  @override
  Future<void> getProjectsForInvestors() {
    return _$getProjectsForInvestorsAsyncAction
        .run(() => super.getProjectsForInvestors());
  }

  @override
  String toString() {
    return '''
projectsForInvestorsList: ${projectsForInvestorsList},
isLoading: ${isLoading}
    ''';
  }
}
