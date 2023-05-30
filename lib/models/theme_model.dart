import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_samaritan/pages/beta/dark_mode.dart';

class ThemeModel extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme(bool isDark){
    _themeMode = isDark? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}