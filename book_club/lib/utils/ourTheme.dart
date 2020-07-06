import 'package:flutter/material.dart';

class OurTheme{

  Color lightGreen = Color.fromARGB(255, 213, 235, 220);
  Color lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color darkerGrey= Color.fromARGB(255,119,124,135);

  ThemeData buildTheme(){
    return ThemeData(
      canvasColor: lightGreen,
      primaryColor: lightGreen,
      accentColor: lightGrey,
      secondaryHeaderColor: darkerGrey,
      hintColor: lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
           borderSide: BorderSide(
             color: lightGrey),
            
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: lightGreen))),
          buttonTheme: ButtonThemeData(
            buttonColor: darkerGrey,
            padding: EdgeInsets.symmetric(horizontal: 20),
            minWidth: 200,
            height: 40.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          )
      
      );
  }
}