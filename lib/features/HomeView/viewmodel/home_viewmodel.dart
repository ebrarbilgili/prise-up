import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teammate/features/HomeView/HomePageView/view/home_page_view.dart';
import 'package:teammate/features/HomeView/ProfilePageView/view/profile_page_view.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @observable
  var widgetOptions = <Widget>[
    HomePageView(),
    ProfilePageView(),
  ];
}
