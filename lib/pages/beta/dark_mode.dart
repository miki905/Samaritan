import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeSettings() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _isDark = sharedPreferences.getBool('is_Dark') ?? false;
    if (_isDark) {
      _currentTheme = _createDarkTheme();
    } else {
      _currentTheme = _createLightTheme();
    }
    notifyListeners();
  }

  ThemeData _createDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.dark(
        // brightness: Brightness.dark,
        background: Color(0xFF002626),
        primary:  Color(0xFF0E4749),// Set your custom primary color
        secondary: Color(0xFFE55812),
        tertiary: Colors.white,
        surface: Color(0xFF0E4749),
          // Set your custom secondary color
        // ... customize other colors as needed
      ),
      // ... other customizations for dark theme
    );
  }

  ThemeData _createLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        background: Colors.white,
        // primary: Colors.black54,
        primary: Color.fromRGBO(64, 181, 173, 1.0), // Set your custom primary color
        // secondary: Color(0xFF59C1BD),
        secondary: Color.fromRGBO(65, 105, 225, 1.0),
        tertiary: Colors.black,
        surface: Colors.black54
        // Set your custom secondary color
        // ... customize other colors as needed
      ),
      // ... other customizations for light theme
    );
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _isDark = !_isDark;
    if (_isDark) {
      _currentTheme = _createDarkTheme();
    } else {
      _currentTheme = _createLightTheme();
    }
    await sharedPreferences.setBool('is_Dark', _isDark);
    notifyListeners();
  }
}
