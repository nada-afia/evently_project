import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:evently_app/utilts/app_them.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import '../provider/app_them_provider.dart';
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemProvider>(context);
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return IntroductionScreen(
      rtl: false,
      pages: [
        buildPage(image: AppImages.hotTrending,
            text1: AppLocalizations.of(context)!.findEventsThatInspireYou,
            text2: AppLocalizations.of(context)!.introText2,
            width: width,
            height: height, context: context)
        ,
        buildPage(image: AppImages.managerDisk,
            text1:AppLocalizations.of(context)!.effortlessEventPlanning,
            text2: AppLocalizations.of(context)!.introText3,
            width: width,
            height: height, context: context)
        ,
        buildPage(image: AppImages.socialMedia,
            text1:AppLocalizations.of(context)!.connectWithFriends,
            text2:AppLocalizations.of(context)!.introText4,
            width: width,
            height: height, context: context)

      ],
      showBackButton: true,
      back: Container(
        width: width * 0.09,
        height: height * 0.04,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blue,
              width: 1,
            )
        ),
        child: Icon(Icons.arrow_back, color: AppColors.blue,),
      ),
      next: Container(
        width: width * 0.09,
        height: height * 0.04,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blue,
              width: 1,
            )
        ),
        child: Icon(Icons.arrow_forward, color: AppColors.blue,),
      ),
      done: Container(
        width: width * 0.09,
        height: height * 0.04,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.blue,
              width: 1,
            )
        ),
        child: Icon(
          Icons.arrow_forward, color: AppThem.lightMode.iconTheme.color,
          size: AppThem.lightMode.iconTheme.size,),
      ),
      onDone: () {
        Navigator.of(context).pushNamed(AppRoutes.login);
      },
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: AppColors.blue,
        color: !themeProvider.isDark()?AppColors.black:AppColors.beige,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
      ),
      controlsPadding: EdgeInsets.symmetric(
          horizontal: height * 0.01, vertical: width * 0.04),
    );
  }

  PageViewModel buildPage(
      {required String image, required String text1, required String text2, required var width, required var height,required BuildContext context }) {
     return PageViewModel(
        titleWidget: Column(
          children: [
            Image.asset(
              AppImages.introLogo, width: width * 0.49, height: height * 0.06,),
          ],
        ),
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [Image.asset(image, width: width * 0.90, height: height * 0.42,),
            SizedBox(height: height * 0.04,),
            Text(text1, style: AppStyles.blueBold20,),
            SizedBox(height: height * 0.04,),
            Text(text2, style: Theme.of(context).textTheme.titleLarge)],)
    );
  }
}
