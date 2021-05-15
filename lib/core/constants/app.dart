import 'package:flutter/material.dart';

class AppConstants {
  static const BASE_URL = 'http://localhost:8000';
  // static const BASE_URL = 'https://teammateapp.herokuapp.com/';

  static const SUPPORTED_LOCALE = [
    AppConstants.EN_LOCALE,
    AppConstants.TR_LOCALE
  ];

  static const TR_LOCALE = Locale('tr', 'TR');
  static const EN_LOCALE = Locale('en', 'US');
  static const LANG_PATH = 'assets/lang/';

  static const LOGO =
      'https://www.qbrobotics.com/wp-content/uploads/2018/03/sample-logo-490x200.png';

  static const APPBAR_LOGO =
      'https://www.qbrobotics.com/wp-content/uploads/2018/03/sample-logo-170x150.png';

  static const LOTTIE_CONFRIM = 'assets/lottie/confirm.json';
}
