import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../HomeView/HomePageView/model/home_page_model.dart';
import '../model/search_model.dart';

class SearchView extends StatelessWidget {
  final List<GetProjectModel> projectList;

  SearchView({required this.projectList});

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(context),
    );
  }

  TextField buildTextField(BuildContext context) {
    return TextField(
      decoration: buildInputDecoration(context),
      autofocus: false,
      focusNode: FocusNode(skipTraversal: true),
      onTap: () => showSearchFunction(context),
    );
  }

  void showSearchFunction(BuildContext context) {
    showSearch(
      context: context,
      delegate: SearchModel(
        allProjects: projectList,
        allProjectsSuggestion: projectList,
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.secondary,
        ),
      ),
      hintText: LocaleKeys.home_home_search.locale,
      icon: FaIcon(
        FontAwesomeIcons.search,
        color: context.colorScheme.primary,
      ),
    );
  }
}
