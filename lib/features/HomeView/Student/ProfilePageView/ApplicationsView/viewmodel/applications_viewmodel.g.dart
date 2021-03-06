// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApplicationsViewModel on _ApplicationsViewModelBase, Store {
  final _$applicationsListAtom =
      Atom(name: '_ApplicationsViewModelBase.applicationsList');

  @override
  List<AppliedModel> get applicationsList {
    _$applicationsListAtom.reportRead();
    return super.applicationsList;
  }

  @override
  set applicationsList(List<AppliedModel> value) {
    _$applicationsListAtom.reportWrite(value, super.applicationsList, () {
      super.applicationsList = value;
    });
  }

  final _$fetchMyApplicationsAsyncAction =
      AsyncAction('_ApplicationsViewModelBase.fetchMyApplications');

  @override
  Future<List<AppliedModel>> fetchMyApplications() {
    return _$fetchMyApplicationsAsyncAction
        .run(() => super.fetchMyApplications());
  }

  final _$onRefreshAsyncAction =
      AsyncAction('_ApplicationsViewModelBase.onRefresh');

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  @override
  String toString() {
    return '''
applicationsList: ${applicationsList}
    ''';
  }
}
