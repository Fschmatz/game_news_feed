import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFFFFFF),
    primary: Color(0xffe2187f),
    secondary: Color(0xffe2187f),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFFFF),
      color: Color(0xFFFFFFFF),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF050505)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF2F1F3),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFEBEAEC),
    selectedItemColor: Color(0xffe2187f),
  ),
  bottomAppBarColor: const Color(0xFFEBEAEC),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFEBEAEC),
      indicatorColor: const Color(0xffe02585),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

ThemeData dark = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontWeight: FontWeight.w400),
  ),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF212022),
  scaffoldBackgroundColor: const Color(0xFF212022),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212022),
    primary: Color(0xFFf590c3),
    secondary: Color(0xFFf590c3),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF212022),
      color: Color(0xFF212022),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF313034),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF212022),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28)),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2B2A2C),
  ),
  bottomAppBarColor: const Color(0xFF2B2A2C),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF2B2A2C),
      indicatorColor: const Color(0xff853866),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEDEAEB),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEDEAEB), fontWeight: FontWeight.w500))),
);
