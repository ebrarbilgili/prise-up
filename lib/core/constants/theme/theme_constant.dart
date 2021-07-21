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
        textButtonTheme: textButtonThemeData,
      );

  TextButtonThemeData get textButtonThemeData {
    return TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(colorScheme.onSurface),
      ),
    );
  }

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
        // overlayColor: MaterialStateProperty.all(colorScheme.onSurface),
      ),
    );
  }

  ColorScheme get colorScheme => ColorScheme(
        primary: Color(0xff880c8a), //xxx
        primaryVariant: Color(0xff580b59), //xxx
        secondary: Color(0xffc04cc2), //xxx
        secondaryVariant: Color(0xff8d408f), //xxx
        surface: Colors.transparent, //xxx
        background: Colors.white, //xxx
        error: Colors.red, //xxx
        onPrimary: Colors.black, //xxx
        onSecondary: Colors.grey.shade100, //xxx
        onSurface: Color(0x1FE568E7),
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.light,
      );
}
//lf30_editor_7susa7jt
