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
    backgroundColor: Color(0xFFEDEAEC),
    selectedItemColor: Color(0xffda3791),
  ),
  bottomAppBarColor: const Color(0xFFEDEAEC),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFEDEAEC),
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
  primaryColor: const Color(0xFF212022),
  scaffoldBackgroundColor: const Color(0xFF212022),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212022),
    primary: Color(0xFFffafd5),
    secondary: Color(0xFFffafd5),
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF212022),
      color: Color(0xFF212022),),
  cardTheme: const CardTheme(
    color: Color(0xFF313034),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color(0xFF212022),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF2B2A2C),
  ),
  bottomAppBarColor: const Color(0xFF2B2A2C),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF2B2A2C),
      indicatorColor: const Color(0xff782856),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEDEAEB),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEDEAEB), fontWeight: FontWeight.w500))),
);
