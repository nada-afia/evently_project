import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';

class AppThem{
  static final ThemeData lightMode= ThemeData(
    scaffoldBackgroundColor: AppColors.primarybackground,
    primaryColor: AppColors.white,
      iconTheme: IconThemeData(
          color: AppColors.blue,
          size: 20
      ),
    textTheme: TextTheme(
       headlineLarge: AppStyles.blackMed16
    )
  );
  static final ThemeData darkMode= ThemeData(
    scaffoldBackgroundColor: AppColors.primarybackground,
    primaryColor: AppColors.dark,
      iconTheme: IconThemeData(
          color: AppColors.blue,
          size: 20
      ),
      textTheme: TextTheme(
          headlineLarge: AppStyles.beigeMed16
      )
  );
}