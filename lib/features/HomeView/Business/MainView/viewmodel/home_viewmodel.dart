import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../HomePageView/view/home_page_view.dart';
import '../../ProfilePageView/view/profile_page_view.dart';

part 'home_viewmodel.g.dart';

class BusinessHomeViewModel = _BusinessHomeViewModelBase
    with _$BusinessHomeViewModel;

abstract class _BusinessHomeViewModelBase with Store {
  @observable
  int selectedIndex = 0;

  @action
  void onItemTapped(int index) {
    selectedIndex = index;
  }

  @observable
  var widgetOptions = <Widget>[
    BusinessHomePageView(),
    BusinessProfilePageView(),
  ];
}
