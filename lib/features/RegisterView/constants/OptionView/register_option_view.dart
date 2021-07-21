import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/extensions/locale_extensions.dart';
import '../../../../core/lang/locale_key.g.dart';
import '../../view/register_view.dart';

class RegisterOptionView extends StatelessWidget {
  const RegisterOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          LocaleKeys.sign_up_option_option.locale,
          style: context.textTheme.headline6!
              .copyWith(color: context.colorScheme.primary),
        ),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOptionButton(
            context,
            LocaleKeys.sign_up_option_student.locale,
            () => context.navigation.push(
              MaterialPageRoute(
                builder: (context) => RegisterView(accountType: 0),
              ),
            ),
          ),
          buildDivider,
          buildOptionButton(
            context,
            LocaleKeys.sign_up_option_business.locale,
            () => context.navigation.push(
              MaterialPageRoute(
                builder: (context) => RegisterView(accountType: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Divider get buildDivider => Divider();

  Widget buildOptionButton(
      BuildContext context, String title, void Function() onPressed) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: context.normalBorderRadius,
            side: BorderSide(
              color: context.colorScheme.secondaryVariant,
            ),
          ),
        )),
        child: Container(
          width: context.dynamicWidth(0.42),
          height: context.dynamicHeight(0.12),
          child: Center(
            child: AutoSizeText(
              title,
              style: context.textTheme.headline6!
                  .copyWith(color: context.colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
