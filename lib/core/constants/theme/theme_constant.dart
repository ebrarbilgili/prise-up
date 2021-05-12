import 'package:flutter/material.dart';

class ThemeConstant {
  static ThemeConstant? _instance;
  static ThemeConstant get instance {
    _instance ??= ThemeConstant._init();
    return _instance!;
  }

  ThemeConstant._init();

  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: colorScheme.background,
        colorScheme: colorScheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        appBarTheme: appBarTheme,
        indicatorColor: colorScheme.primary,
      );

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      backgroundColor: colorScheme.background,
      iconTheme: IconThemeData(color: colorScheme.primaryVariant),
      elevation: 0,
    );
  }

  ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }

  ColorScheme get colorScheme => ColorScheme(
        primary: Color(0xff880c8a),
        primaryVariant: Color(0xff580b59),
        secondary: Color(0xffc04cc2),
        secondaryVariant: Color(0xff8d408f),
        surface: Colors.transparent,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.grey,
        onSurface: Colors.amber,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.light,
      );
}
