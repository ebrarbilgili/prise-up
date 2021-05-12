import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/constants/app.dart';
import 'core/constants/theme/theme_constant.dart';
import 'features/LoginView/view/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppConstants.SUPPORTED_LOCALE,
      fallbackLocale: AppConstants.EN_LOCALE,
      path: AppConstants.LANG_PATH,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teammate App',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.instance.themeData,
      home: LoginView(),
      // SignUpView()
    );
  }
}
