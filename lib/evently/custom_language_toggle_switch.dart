import 'package:evently_app/utilts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../provider/app_language_provider.dart';
import '../utilts/app_color.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return ToggleSwitch(
      borderWidth: 3,
      minWidth: 50.0,
      radiusStyle: true,
      inactiveBgColor: AppColors.transparent,
      initialLabelIndex: languageProvider.appLanguage == 'en' ? 0 : 1,
      cornerRadius: 30.0,
      borderColor: [AppColors.blue],
      activeBgColor: [AppColors.blue],
      totalSwitches: 2,
      customWidgets: [
        Image.asset(AppImages.usa),
        Image.asset(AppImages.egypt),
      ],
      onToggle: (index) {
          if (index == 0) {
            languageProvider.changeLanguage('en');
          } else {
            languageProvider.changeLanguage('ar');
          }
      },
    );
  }
}
