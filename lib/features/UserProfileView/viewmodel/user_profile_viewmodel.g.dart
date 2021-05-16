// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserProfileViewModel on _UserProfileViewModelBase, Store {
  final _$userProfileListAtom =
      Atom(name: '_UserProfileViewModelBase.userProfileList');

  @override
  List<UserProfileModel> get userProfileList {
    _$userProfileListAtom.reportRead();
    return super.userProfileList;
  }

  @override
  set userProfileList(List<UserProfileModel> value) {
    _$userProfileListAtom.reportWrite(value, super.userProfileList, () {
      super.userProfileList = value;
    });
  }

  final _$fetchUserProfileAsyncAction =
      AsyncAction('_UserProfileViewModelBase.fetchUserProfile');

  @override
  Future<List<UserProfileModel>> fetchUserProfile() {
    return _$fetchUserProfileAsyncAction.run(() => super.fetchUserProfile());
  }

  @override
  String toString() {
    return '''
userProfileList: ${userProfileList}
    ''';
  }
}
