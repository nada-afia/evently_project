import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemProvider extends ChangeNotifier{
  ThemeMode appThem=ThemeMode.light;
  Future<void> changeThem(ThemeMode newThem) async {
    if(appThem == newThem){
      return;
    }
    appThem = newThem;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newThem == ThemeMode.dark);
    notifyListeners();
  }
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDarkMode') ?? false;
    appThem = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool isDark(){
    return appThem==ThemeMode.dark;
  }
}