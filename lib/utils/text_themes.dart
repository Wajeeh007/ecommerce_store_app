import 'package:flutter/material.dart';

class TextThemes {
    static TextTheme textTheme({required Color color}) => TextTheme(
      titleLarge: TextStyle(
          fontSize: 34,
          color: color,
          fontWeight: FontWeight.bold
      ),
      titleMedium: TextStyle(
          fontSize: 32,
          color: color,
          fontWeight: FontWeight.bold
      ),
      titleSmall: TextStyle(
          fontSize: 30,
          color: color,
          fontWeight: FontWeight.bold
      ),
      bodyLarge: TextStyle(
          fontSize: 24,
          color: color,
          fontWeight: FontWeight.w600
      ),
      bodyMedium: TextStyle(
          fontSize: 22,
          color: color,
          fontWeight: FontWeight.w600
      ),
      bodySmall: TextStyle(
          fontSize: 20,
          color: color,
          fontWeight: FontWeight.w600
      ),
      labelLarge: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w400
      ),
      labelMedium: TextStyle(
          fontSize: 14,
          color: color,
          fontWeight: FontWeight.w400
      ),
      labelSmall: TextStyle(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w400
      ),
    ).apply(
      fontFamily: 'Poppins'
    );
}