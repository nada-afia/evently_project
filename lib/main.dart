 import 'package:evently_app/auth/login/create_account.dart';
import 'package:evently_app/auth/login/forget_password.dart';
import 'package:evently_app/evently/befor_intro.dart';
import 'package:evently_app/evently/intro_screen.dart';
import 'package:evently_app/auth/login/login_screen.dart';
import 'package:evently_app/evently/tabs/favourite/favourite_screen.dart';
import 'package:evently_app/evently/tabs/home/widget/bottom_navbar.dart';
import 'package:evently_app/evently/tabs/profile/profile_screen.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:evently_app/utilts/app_them.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'evently/tabs/Map/map_screen.dart';
import 'evently/tabs/home/home_screen.dart';
import 'l10n/app_localizations.dart';

 void main() {
   runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (_) => AppThemProvider()),
         ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
       ],
       child: const MyApp(),
     ),
   );
 }

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     var languageProvider=Provider.of<AppLanguageProvider>(context);
     var themeProvider = Provider.of<AppThemProvider>(context);
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales: AppLocalizations.supportedLocales,
       initialRoute: AppRoutes.beforIntro,
       routes: {
         AppRoutes.beforIntro: (context) => BeforIntro(),
         AppRoutes.introRoute: (context) => IntroScreen(),
         AppRoutes.login: (context) => LoginScreen(),
         AppRoutes.forgetScreen: (context) => ForgetPassword(),
       AppRoutes.createScreen:(context)=>CreateAccount(),
         AppRoutes.profileScreen:(context) =>ProfileScreen(),
         AppRoutes.homeScreen:(context) =>HomeScreen(),
         AppRoutes.favouriteScreen:(context) =>FavouriteScreen(),
         AppRoutes.mapScreen:(context) =>MapScreen(),
         AppRoutes.mainScreen:(context) =>MainScreen(),

       },
       locale:Locale(languageProvider.appLanguage),
       theme: AppThem.lightMode,
       darkTheme: AppThem.darkMode,
       themeMode: themeProvider.appThem,
     );}
 }
