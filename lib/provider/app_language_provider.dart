import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }

    appLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', newLanguage);

    notifyListeners();
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('appLanguage') ?? 'en';

    notifyListeners();
  }

  bool isEnglish() {
    return appLanguage == 'en';
  }
}
