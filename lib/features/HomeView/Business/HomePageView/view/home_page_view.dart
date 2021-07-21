import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../SearchView/view/search_view.dart';
import '../viewmodel/home_page_viewmodel.dart';

class BusinessHomePageView extends StatelessWidget {
  BusinessHomePageView({Key? key}) : super(key: key);

  final viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return RefreshIndicator(
            key: viewModel.refreshIndicatorKey,
            color: context.colorScheme.primary,
            onRefresh: () async {},
            child: ListView(
              children: [SearchView(projectList: [])],
            ));
      },
    );
  }
}
