
import 'package:evently_app/evently/custom_language_toggle_switch.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../provider/app_language_provider.dart';
import '../utilts/app_color.dart';
import '../utilts/app_images.dart';
import '../utilts/app_routes.dart';
import '../utilts/app_them.dart';
class Content {
  String centerImage;
  String text1;
  String? text2;

  Content({
    required this.centerImage,
    required this.text1,
    this.text2,
  });
}
class BeforIntro extends StatelessWidget {
  BeforIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
     body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: height*0.02),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(AppImages.introLogo, width: width * 0.40,
                    height: height * 0.06,),
                ),
                SizedBox(height: height*0.04,),
                Center(
                  child: Image.asset(
                    AppImages.beingCreative,
                    width: width * 0.91,
                    height: height * 0.43,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.personalizeYourExperience,
                  textAlign: TextAlign.left,
                  style: AppStyles.blueMed20,
                ),

                SizedBox(height: height * 0.02),
                Text(
                  AppLocalizations.of(context)!.introText1,
                  textAlign: TextAlign.left,
                  style: !themeProvider.isDark()?AppStyles.blackMed16:AppStyles.beigeMed16,
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: AppStyles.blueMed20,
                    ),
                    Spacer(),
                   CustomToggleSwitch()
                  ],
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.theme,
                      style: AppStyles.blueMed20,
                    ),
                    Spacer(),
                    buildbutton(first: AppImages.sunImage, second: AppImages.moonImage, context: context)
                  ],
                ),
                SizedBox(height: height*0.02,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.introRoute);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.letsStart,
                      style: AppStyles.whiteMed20,
                    ),
                  ),
                )
              ])),
    );
  }
  ToggleSwitch buildbutton({
    required String first,
    required String second,
    required BuildContext context,
  }) {
    final themeProvider = context.watch<AppThemProvider>();

    return ToggleSwitch(
      borderWidth: 3,
      minWidth: 50.0,
      radiusStyle: true,
      inactiveBgColor: AppColors.transparent,
      initialLabelIndex: themeProvider.appThem == ThemeMode.light ? 0 : 1,
      cornerRadius: 30.0,
      borderColor: [AppColors.blue],
      activeBgColor: [AppColors.blue],
      totalSwitches: 2,
      customWidgets: [
        Image.asset(first),
        Image.asset(second),
      ],
      onToggle: (index) {
        if (index == 0) {
          themeProvider.changeThem(ThemeMode.light);
        } else {
          themeProvider.changeThem(ThemeMode.dark);
        }
      },
    );

}

}
