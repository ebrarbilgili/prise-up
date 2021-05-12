import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:teammate/core/constants/provider/cache_provider.dart';
import 'package:teammate/core/extensions/locale_extensions.dart';
import 'package:teammate/core/lang/locale_key.g.dart';
import 'package:teammate/features/LoginView/view/login_view.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        TextButton(
          onPressed: () async {
            await context.read<CacheProvider>().clearCache();
            await context.navigation.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginView(),
              ),
              (route) => false,
            );
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.home_profile_logout.locale,
              style: context.textTheme.headline6!
                  .copyWith(color: context.colorScheme.error),
            ),
          ),
        ),
      ],
    );
  }
}
