import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../../core/extensions/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../../../core/widgets/LocaleText/locale_text.dart';
import '../../HomeView/Student/HomePageView/DetailsView/view/details_view.dart';
import '../../HomeView/Student/HomePageView/model/home_page_model.dart';

class SearchModel extends SearchDelegate<GetProjectModel> {
  final List<GetProjectModel> allProjects;
  final List<GetProjectModel> allProjectsSuggestion;

  SearchModel({required this.allProjects, required this.allProjectsSuggestion});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: FaIcon(
          FontAwesomeIcons.trash,
          color: context.colorScheme.primary,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: FaIcon(
        FontAwesomeIcons.chevronLeft,
        color: context.colorScheme.primary,
      ),
      onPressed: () {
        close(context, allProjects.first);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final allProject = allProjects.where(
      (element) {
        if (!element.desc!.toLowerCase().contains(query.toLowerCase())) {
          if (!element.id!
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            if (!element.desc!.toLowerCase().contains(query.toLowerCase())) {
              if (!element.title!.toLowerCase().contains(query.toLowerCase())) {
                return element.university!
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }

              return element.title!.toLowerCase().contains(query.toLowerCase());
            }

            return element.desc!.toLowerCase().contains(query.toLowerCase());
          }

          return element.id!
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase());
        } else {
          return element.desc!.toLowerCase().contains(query.toLowerCase());
        }
      },
    ).toList();

    return ListView.builder(
      itemCount: allProject.length,
      itemBuilder: (BuildContext context, int index) {
        final data = allProject[index];
        return Card(
          child: ListTile(
            title: buildProjectTitle(data, context),
            subtitle: buildCardSubColumn(data, context),
            trailing: buildDetailsButton(data, context),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final allProject = allProjectsSuggestion.where(
      (element) {
        if (!element.desc!.toLowerCase().contains(query.toLowerCase())) {
          if (!element.id!
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            if (!element.desc!.toLowerCase().contains(query.toLowerCase())) {
              if (!element.title!.toLowerCase().contains(query.toLowerCase())) {
                return element.university!
                    .toLowerCase()
                    .contains(query.toLowerCase());
              }

              return element.title!.toLowerCase().contains(query.toLowerCase());
            }

            return element.desc!.toLowerCase().contains(query.toLowerCase());
          }

          return element.id!
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase());
        } else {
          return element.desc!.toLowerCase().contains(query.toLowerCase());
        }
      },
    ).toList();

    return ListView.builder(
      itemCount: allProject.length,
      itemBuilder: (BuildContext context, int index) {
        final data = allProject[index];
        return Card(
          child: ListTile(
            title: buildProjectTitle(data, context),
            subtitle: buildCardSubColumn(data, context),
            trailing: buildDetailsButton(data, context),
          ),
        );
      },
    );
  }

  Column buildCardSubColumn(GetProjectModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDivider,
        buildSubtitle(data, context),
        buildUniversity(data, context),
        buildFullname(data, context),
      ],
    );
  }

  AutoSizeText buildFullname(GetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.userProfile!.first_name} ${data.userProfile!.last_name}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildUniversity(GetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.university}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  AutoSizeText buildSubtitle(GetProjectModel data, BuildContext context) {
    return AutoSizeText(
      '${data.subtitle}',
      style: context.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
    );
  }

  TextButton buildDetailsButton(GetProjectModel data, BuildContext context) {
    return TextButton(
      onPressed: () {
        context.navigation.push(MaterialPageRoute(
          builder: (context) => DetailsView(model: data),
        ));
      },
      child: LocaleText(text: LocaleKeys.home_home_detail),
    );
  }

  Divider get buildDivider => Divider();

  Row buildProjectTitle(GetProjectModel data, BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          '${data.title} ',
          style: context.textTheme.headline6!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        AutoSizeText(
          '${LocaleKeys.home_home_id.locale}: ${data.id}',
          style: context.textTheme.bodyText1!
              .copyWith(fontWeight: FontWeight.w200),
        ),
      ],
    );
  }
}
