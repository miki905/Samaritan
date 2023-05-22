import 'package:flutter/material.dart';

class Style {
  static Color medicineDescriptionColorPrimary = Color.fromRGBO(2, 84, 100, 1);
  static Color medicineDescriptionColorSecondary =
      Color.fromARGB(229, 124, 35,1);
  static Color medicineDescriptionColorMain = Color.fromRGBO(2, 84, 100, 1);
  static Color flashLightColor = Color.fromRGBO(248, 241, 241, 1);

  static Color homeScanButtonColor = Color.fromRGBO(2, 84, 100, 1);

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
