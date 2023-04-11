import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

ThemeData buildDarkTheme([String fontFamily = 'Roboto', String fontHeader = 'Raleway']) {
  final base = ThemeData.dark();
  return base.copyWith(
    textTheme:
        buildTextTheme(base.textTheme, fontFamily, fontHeader).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    primaryTextTheme:
        buildTextTheme(base.primaryTextTheme, fontFamily, fontHeader)
            .apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    canvasColor: kDarkBG,
    hintColor: Colors.white,
    cardColor: kDarkBgLight,
    brightness: Brightness.dark,
    backgroundColor: kDarkBG,
    primaryColor: kDarkBG,
    primaryColorLight: kDarkBgLight,
    // scaffoldBackgroundColor: Colors.red,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: kDarkAccent,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: kColorScheme.copyWith(onPrimary: kLightBG)),
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kDarkAccent).copyWith(secondary: kDarkBG),
  );
}
