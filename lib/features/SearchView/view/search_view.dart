import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../HomeView/Student/HomePageView/model/home_page_model.dart';
import '../model/search_model.dart';

class SearchView extends StatelessWidget {
  final List<GetProjectModel> projectList;

  SearchView({required this.projectList});

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.dynamicHeight(0.02),
        right: context.dynamicHeight(0.02),
        bottom: context.dynamicHeight(0.02),
        top: context.dynamicHeight(0.01),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: context.normalRadius * 1.6,
          bottomRight: context.normalRadius * 1.6,
        ),
        color: context.colorScheme.primary,
      ),
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
          color: context.colorScheme.background,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: context.normalBorderRadius,
        borderSide: BorderSide(
          color: context.colorScheme.background,
        ),
      ),
      fillColor: context.colorScheme.background,
      hintText: LocaleKeys.home_home_search.locale,
      filled: true,
      hintStyle: context.textTheme.bodyText1!.copyWith(color: Colors.grey),
      icon: FaIcon(
        FontAwesomeIcons.search,
        color: context.colorScheme.background,
      ),
    );
  }
}
