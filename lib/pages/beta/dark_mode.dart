import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier{



  ThemeData _currentTheme = ThemeData();
  ThemeData get currentTheme => _currentTheme;

  ThemeSettings (bool isDark){
    if(isDark){
      _currentTheme = ThemeData.dark(
      );
    }else{
      _currentTheme = ThemeData.light(
      );
    }
  }

  void toogleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(_currentTheme == ThemeData.light()){
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool('is_Dark', true);
    }else{
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool('is_Dark', false);

    }
    notifyListeners();
  }
}