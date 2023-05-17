import 'package:flutter/material.dart';

class Style {
  static Color medicineDescriptionColorPrimary = Color(0xFF59C1BD);
  static Color medicineDescriptionColorSecondary =
      Color.fromARGB(255, 84, 62, 131);
  static Color medicineDescriptionColorMain = Color(0xFF59C1BD);
  static Color flashLightColor = Colors.grey.shade400;

  static Color homeScanButtonColor = Color(0xFF59C1BD);

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
      iconTheme: const IconThemeData(color: Color(0xFF59C1BD)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme:
              IconThemeData(color: Color(0xFF59C1BD))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF59C1BD))),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Colors.white,

      )


  );
}
