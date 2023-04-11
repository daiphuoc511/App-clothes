import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

IconThemeData customIconTheme(IconThemeData original) {
  return original.copyWith(color: kGrey900);
}

ThemeData buildLightTheme(
    [String fontFamily = 'Roboto', String fontHeader = 'Raleway']) {
  final base = ThemeData.light();
  return base.copyWith(
    focusColor: Colors.white,
    brightness: Brightness.light,
    errorColor: kErrorRed,
    buttonTheme: const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: kDarkBG),
    primaryColorLight: kLightBG,
    primaryIconTheme: customIconTheme(base.iconTheme),
    textTheme: buildTextTheme(base.textTheme, fontFamily, fontHeader),
    primaryTextTheme:
        buildTextTheme(base.primaryTextTheme, fontFamily, fontHeader),
    iconTheme: customIconTheme(base.iconTheme),
    hintColor: Colors.black26,
    backgroundColor: Colors.grey.shade200,
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kLightBG,
    appBarTheme:  AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kDarkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ), colorScheme: kColorScheme.copyWith(secondary: kLightAccent).copyWith(secondary: Colors.lightBlue),
  );
}
