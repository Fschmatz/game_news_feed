import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//CLARO
ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColorBrightness: Brightness.dark,
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFFFFFF),
    primary: Color(0xFFe00f7a),
    secondary:  Color(0xFFe00f7a),
    secondaryVariant: Color(0xFFe00f7a),
  ),
  appBarTheme: const AppBarTheme(
      color: Color(0xFFFFFFFF),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF050505)),
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF000000))),
  cardTheme: const CardTheme(
    color: Color(0xFFF2F1F5),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFEBEAEF),
    selectedItemColor:  Color(0xFFe00f7a),
  ),
  bottomAppBarColor: const Color(0xFFEBEAEF),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFEBEAEF),
      indicatorColor:  const Color(0xFFe00f7a),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFF050505),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFF050505), fontWeight: FontWeight.w500))),
);

//ESCURO
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColorBrightness: Brightness.light,
  primaryColor: const Color(0xFF212024),
  scaffoldBackgroundColor: const Color(0xFF212024),
  colorScheme: const ColorScheme.dark(
      background: Color(0xFF212024),
      primary: Color(0xFFf590c3),
      secondary: Color(0xFFf590c3),
      secondaryVariant: Color(0xFFf590c3)),
  appBarTheme: const AppBarTheme(
      color: Color(0xFF212024),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))),
  cardTheme: const CardTheme(
    color: Color(0xFF2B2A2E),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF161519),
  ),
  bottomAppBarColor: const Color(0xFF161519),
  navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF161519),
      indicatorColor: const Color(0xFFf590c3),
      iconTheme: MaterialStateProperty.all(const IconThemeData(
        color: Color(0xFFEAEAEA),
      )),
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
          color: Color(0xFFEAEAEA), fontWeight: FontWeight.w500))),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'valorTema';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _darkTheme);
  }
}
