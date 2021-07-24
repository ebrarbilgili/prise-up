import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class FindInvestorCard extends StatelessWidget {
  FindInvestorCard({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.page,
  }) : super(key: key);

  final IconData leadingIcon;
  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.verticalPaddingLow,
      padding: context.verticalPaddingLow,
      decoration: buildBoxDecoration(context),
      child: ListTile(
        leading: buildLeading(context),
        title: buildTitle(context),
        subtitle: buildSubtitle(context),
        trailing: buildTrailing(context),
        onTap: () => context.navigation
            .push(MaterialPageRoute(builder: (context) => page)),
      ),
    );
  }

  FaIcon buildTrailing(BuildContext context) {
    return FaIcon(
      trailingIcon,
      color: context.colorScheme.primary,
    );
  }

  Widget buildSubtitle(BuildContext context) {
    return AutoSizeText(
      subtitle,
      style: context.textTheme.bodyText1,
    );
  }

  Widget buildTitle(BuildContext context) {
    return AutoSizeText(
      title,
      style: context.textTheme.headline6,
    );
  }

  FaIcon buildLeading(BuildContext context) {
    return FaIcon(
      leadingIcon,
      color: context.colorScheme.primary,
      size: 32,
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(color: context.colorScheme.secondaryVariant),
      borderRadius: BorderRadius.all(context.normalRadius),
    );
  }
}
