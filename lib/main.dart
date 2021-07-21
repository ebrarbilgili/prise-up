import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app.dart';
import 'core/constants/provider/cache_provider.dart';
import 'core/constants/shared/shared_prefs_constant.dart';
import 'core/constants/theme/theme_constant.dart';
import 'features/Splash/splash.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesConstant.prefrencesInit();

  // await Firebase.initializeApp();
}

Future<void> main() async {
  await init();

  runApp(
    EasyLocalization(
      supportedLocales: AppConstants.SUPPORTED_LOCALE,
      fallbackLocale: AppConstants.EN_LOCALE,
      path: AppConstants.LANG_PATH,
      child: MultiProvider(
        providers: [
          Provider<CacheProvider>(create: (context) => CacheProvider())
        ],
        child: MyApp(),
      ),
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
        home: SplashScreen()
        // SignUpView()
        );
  }
}
