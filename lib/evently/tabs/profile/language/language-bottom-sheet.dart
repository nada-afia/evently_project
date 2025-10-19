import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_language_provider.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
             languageProvider.changeLanguage('en');
             Navigator.pop(context);
            },
            child: languageProvider.appLanguage=='en'?
                getSelected(languageName: AppLocalizations.of(context)!.english):
            getUnSelected(languageName: AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: height*0.02,),
          InkWell(onTap: (){
            languageProvider.changeLanguage('ar');
            Navigator.pop(context);
          },
              child: languageProvider.appLanguage=='ar'?getSelected(languageName: AppLocalizations.of(context)!.arabic):
              getUnSelected(languageName: AppLocalizations.of(context)!.arabic))
        ],
      ),
    );
  }

  Widget getSelected({required String languageName }){
    return  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(languageName,style: AppStyles.blueBold14,),
      Icon(Icons.check,color: AppColors.blue,)
],
);
}
  Widget getUnSelected({required String languageName }){
    return  Text(languageName,style:Theme.of(context).textTheme.headlineSmall,);
  }
}
