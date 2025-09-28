 import 'package:evently_app/evently/tabs/profile/language/language-bottom-sheet.dart';
import 'package:evently_app/evently/tabs/profile/theme/theme-bottom-sheet.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/app_them_provider.dart';
import '../../custom_elevated_button.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AppThemProvider themeProvider;

 @override
   @override
   Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;
     var themeProvider = Provider.of<AppThemProvider>(context);
     var languageProvider = Provider.of<AppLanguageProvider>(context);

     return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: AppColors.blue,
       ),
       body: Column(
         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02)
             ,height:height*0.14 ,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
               color: AppColors.blue
             ),
             child:Row(
               children: [
                 Image.asset(AppImages.profilePic),
                 SizedBox(width: width*0.02,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: height*0.02,),
                   ],
                 )
               ],

               )
             ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headlineSmall,),
                 InkWell(
                   onTap:(){
                     showLanguageBottomSheet();
                   },
                   child: Container(
                     margin: EdgeInsets.symmetric(
                       vertical: height*0.02,
                     ),
                       padding: EdgeInsets.symmetric(
                         horizontal: width*0.04,
                         vertical: height*0.02
                       ),
                       decoration: BoxDecoration(
                           color: AppColors.transparent,
                           borderRadius: BorderRadius.circular(16),
                           border: Border.all(
                               color:  AppColors.blue
                           )),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           languageProvider.isEnglish()
                               ? AppLocalizations.of(context)!.english
                               : AppLocalizations.of(context)!.arabic,
                           style: AppStyles.blueMed20,
                         ),
                         Icon(Icons.arrow_drop_down_outlined,color: AppColors.blue,)
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: width*0.04),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(AppLocalizations.of(context)!.theme,style:Theme.of(context).textTheme.headlineSmall,),
                 SizedBox(height: height*0.02,),
                 InkWell(
                   onTap:(){
                     showThemeBottomSheet();
                   },
                   child: Container(
                     margin: EdgeInsets.symmetric(
                       vertical: height*0.02,
                     ),
                     padding: EdgeInsets.symmetric(
                         horizontal: width*0.04,
                         vertical: height*0.02
                     ),
                     decoration: BoxDecoration(
                         color: AppColors.transparent,
                         borderRadius: BorderRadius.circular(16),
                         border: Border.all(
                             color:  AppColors.blue
                         )),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           themeProvider.isDark()
                               ? AppLocalizations.of(context)!.dark
                               : AppLocalizations.of(context)!.light,
                           style: AppStyles.blueMed20,
                         ),

                         Icon(Icons.arrow_drop_down_outlined,color: AppColors.blue,)
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ) ,
           SizedBox(height: height*0.2,),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: width*0.04),
             child: CustomElevatedButton(textButton: AppLocalizations.of(context)!.logout,
               onPressed: () {
               Navigator.of(context).popUntil((route) => route.isFirst,); },
                 bgColor: AppColors.red,
           ),

       ),
     );
   }

  void showLanguageBottomSheet() {
     showModalBottomSheet(
         context: context, builder: (context) => LanguageBottomSheet(),);
  }
   void showThemeBottomSheet() {
     showModalBottomSheet(
       context: context, builder: (context) => ThemeBottomSheet(),);
   }
}
