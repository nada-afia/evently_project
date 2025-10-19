import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemProvider>(context);
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
             themeProvider.changeThem(ThemeMode.light);
             Navigator.pop(context);
            },
            child: themeProvider.appThem==ThemeMode.light?
                getSelected(themeName: AppLocalizations.of(context)!.light):
            getUnSelected(themeName: AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: height*0.02,),
          InkWell(onTap: (){
            themeProvider.changeThem(ThemeMode.dark);
            Navigator.pop(context);
          },
              child: themeProvider.appThem==ThemeMode.dark?getSelected(themeName: AppLocalizations.of(context)!.dark):
              getUnSelected(themeName: AppLocalizations.of(context)!.dark))
        ],
      ),
    );
  }

  Widget getSelected({required String themeName }){
    return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(themeName,style: AppStyles.blueBold14,),
      Icon(Icons.check,color: AppColors.blue,)
],
);
}
  Widget getUnSelected({required String themeName }){
    return  Text(themeName,style: Theme.of(context).textTheme.headlineSmall,);
  }
}
