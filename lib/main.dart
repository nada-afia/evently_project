 import 'package:evently_app/evently/befor_intro.dart';
import 'package:evently_app/evently/intro_screen.dart';
import 'package:evently_app/auth/login/login_screen.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:evently_app/utilts/app_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) =>AppLanguageProvider() ,),
  ChangeNotifierProvider(create: (context) => AppThemProvider(),)],
  child: MyApp()));
 }
 class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
     var languageProvider=Provider.of<AppLanguageProvider>(context);
     var themProvider=Provider.of<AppThemProvider>(context);
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales: AppLocalizations.supportedLocales,
       initialRoute: AppRoutes.beforIntro,
       routes: {
         AppRoutes.beforIntro: (context) => BeforIntro(),
         AppRoutes.introRoute: (context) => IntroScreen(),
         AppRoutes.login: (context) => LoginScreen(),
       },
       locale:Locale(languageProvider.appLanguage),
      theme: AppThem.lightMode,
      darkTheme: AppThem.darkMode,
       themeMode: themProvider.appThem,
     );
   }
 }
