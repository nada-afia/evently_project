
import 'package:flutter/material.dart';

import 'app_color.dart';

class AppThem{

  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    appBarTheme: const AppBarTheme(color:AppColors.primaryBackground),
    primaryColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.blue, size: 20),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: Colors.pink),
    ),
  );

  static ThemeData darkMode = ThemeData.dark().copyWith(

    appBarTheme: const AppBarTheme(color:AppColors.dark),
    primaryColor: AppColors.dark,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color:AppColors.beige),
    ),
  );
}