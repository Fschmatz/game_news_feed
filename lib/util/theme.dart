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
    primary: Color(0xffda3791),
    secondary: Color(0xffda3791),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFFFF),
      color: Color(0xFFFFFFFF),),
  cardTheme: const CardTheme(
    color: Color(0xFFF2F1F3),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFEFEAEC),
    selectedItemColor: Color(0xffda3791),
  ),
  bottomAppBarColor: const Color(0xFFEFEAEC),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFEFEAEC),
      indicatorColor: const Color(0xfffa5c99),
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
  primaryColor: const Color(0xFF1F1F1F),
  scaffoldBackgroundColor: const Color(0xFF1F1F1F),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF1F1F1F),
    primary: Color(0xFFFFB0CC),
    secondary: Color(0xFFFFB0CC),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1F1F1F),
      color: Color(0xFF1F1F1F),),
  cardTheme: const CardTheme(
    color: Color(0xFF313034),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF1F1F1F),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2F2A2E),
  ),
  bottomAppBarColor: const Color(0xFF2F2A2E),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF2F2A2E),
      indicatorColor: const Color(0xff573c4c),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEDEAEB),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEDEAEB), fontWeight: FontWeight.w500))),
);
