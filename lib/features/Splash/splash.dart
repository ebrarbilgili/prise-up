import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app.dart';
import '../../core/constants/provider/cache_provider.dart';
import '../HomeView/view/home_view.dart';
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
      await context.navigation.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeView()),
          (route) => false);
    } else {
      await context.navigation.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginView()),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      controlToApp();
    });
  }

  CacheProvider get readCacheProvider => context.read<CacheProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(AppConstants.LOGO),
      ),
    );
  }
}
