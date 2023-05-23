import 'package:flutter/material.dart';

class Style {
  static Color medicineDescriptionColorPrimary = Color.fromRGBO(19, 47, 107, 1);
  static Color medicineDescriptionColorSecondary =
  Color(0xFF59C1BD);
  static Color medicineDescriptionColorMain = Color.fromRGBO(19, 47, 107, 1);
  static Color flashLightColor = Color.fromRGBO(248, 241, 241, 1);

  static Color homeScanButtonColor = Color(0xFF59C1BD);
  Color kPrimary = Color(0xFF0E4749);
  Color kSecondary = Color(0xFF002626);
  Color kTextPrimary = Color(0xFFEFE7DA);
  Color kTextSecondary = Color(0xFFE55812);
  static var themeData = ThemeData(
      textTheme: const TextTheme(
          bodyText1: TextStyle(
              color: Color(0xFF59C1BD),
              fontWeight: FontWeight.bold),
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          headline2: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
          headlineLarge: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
      iconTheme: const IconThemeData(color: Color.fromRGBO(2, 84, 100, 1)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme:
              IconThemeData(color: Color.fromARGB(229, 124, 35,1))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(232, 170, 66, 1))),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,

      )


  );
}
