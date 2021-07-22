import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app.dart';
import '../../core/constants/provider/cache_provider.dart';
import '../../core/constants/shared/shared_prefs_constant.dart';
import '../HomeView/Business/MainView/view/home_view.dart';
import '../HomeView/Student/MainView/view/home_view.dart';
import '../LoginView/view/login_view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> controlToApp() async {
    if (readCacheProvider.getStringCache('id') != null ||
        readCacheProvider.getStringCache('token') != null) {
      if (readCacheProvider.getStringCache('account_type') == '0') {
        await context.navigation.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false);
      } else if (readCacheProvider.getStringCache('account_type') == '1') {
        await context.navigation.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => BusinessHomeView()),
            (route) => false);
      }
    } else {
      await context.navigation.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginView()),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    // SharedPreferencesConstant.instance.clearCache();
    Future.delayed(Duration(seconds: 1), () {
      controlToApp();
      print('account type: ' +
          SharedPreferencesConstant.instance
              .getStringValue('account_type')
              .toString());
    });
  }

  CacheProvider get readCacheProvider => context.read<CacheProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppConstants.LOGO,
          fit: BoxFit.fitWidth,
          // scale: context.dynamicHeight(0.0008),
        ),
      ),
    );
  }
}
