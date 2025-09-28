
import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_styles.dart';

class AppThem{

  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    appBarTheme: const AppBarTheme(color:AppColors.primaryBackground),
    primaryColor: AppColors.blue,
    focusColor: AppColors.white,
    dividerColor: AppColors.white,
    iconTheme: const IconThemeData(color: Colors.blue, size: 20),
    textTheme:  TextTheme(
      headlineLarge: AppStyles.blueMed16,
      headlineMedium: AppStyles.blueBold16,
      headlineSmall: AppStyles.blackBold20,
      titleLarge: AppStyles.blackMed16
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blue,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white
    ),
    bottomSheetTheme: BottomSheetThemeData(

    )
  );

  static ThemeData darkMode = ThemeData.dark().copyWith(

    appBarTheme: const AppBarTheme(color:AppColors.dark),
    primaryColor: AppColors.dark,
    focusColor: AppColors.blue,
dividerColor: AppColors.dark,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme:   TextTheme(
     headlineLarge: AppStyles. beigeMed16,
      headlineMedium: AppStyles.beigeBold20,
        headlineSmall: AppStyles.beigeBold20,
        titleLarge: AppStyles.beigeMed16
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.dark,
        selectedItemColor: AppColors.beige,
        unselectedItemColor: AppColors.beige
      )
  );
}