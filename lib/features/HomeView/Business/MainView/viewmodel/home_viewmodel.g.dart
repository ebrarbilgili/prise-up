// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BusinessHomeViewModel on _BusinessHomeViewModelBase, Store {
  final _$selectedIndexAtom =
      Atom(name: '_BusinessHomeViewModelBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$widgetOptionsAtom =
      Atom(name: '_BusinessHomeViewModelBase.widgetOptions');

  @override
  List<Widget> get widgetOptions {
    _$widgetOptionsAtom.reportRead();
    return super.widgetOptions;
  }

  @override
  set widgetOptions(List<Widget> value) {
    _$widgetOptionsAtom.reportWrite(value, super.widgetOptions, () {
      super.widgetOptions = value;
    });
  }

  final _$_BusinessHomeViewModelBaseActionController =
      ActionController(name: '_BusinessHomeViewModelBase');

  @override
  void onItemTapped(int index) {
    final _$actionInfo = _$_BusinessHomeViewModelBaseActionController
        .startAction(name: '_BusinessHomeViewModelBase.onItemTapped');
    try {
      return super.onItemTapped(index);
    } finally {
      _$_BusinessHomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
widgetOptions: ${widgetOptions}
    ''';
  }
}
