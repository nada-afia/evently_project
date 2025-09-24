import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_language_toggle_switch.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.of(context).pop();},
            icon: Icon(Icons.arrow_back,color: Colors.blue,)),
        title: Center(child: Text(AppLocalizations.of(context)!.register,style: AppStyles.blueMed20,),),
      ),
      body: Padding(padding:EdgeInsets.symmetric(horizontal: width*0.04),
        child: Column(children: [
           Image.asset(AppImages.logo),
          SizedBox(height: height*0.02,),
          CustomTextField(prefixIcon: Image.asset(AppImages.name),hintText:AppLocalizations.of(context)!.name,),
          SizedBox(height: height*0.02,),
          CustomTextField(prefixIcon: Image.asset(AppImages.email),hintText:AppLocalizations.of(context)!.email,),
          SizedBox(height: height*0.02,),
          CustomTextField(prefixIcon: Image.asset(AppImages.password),hintText:AppLocalizations.of(context)!.password,),
          SizedBox(height: height*0.02,),
          CustomTextField(prefixIcon: Image.asset(AppImages.password),hintText:AppLocalizations.of(context)!.rePassword,),
          SizedBox(height: height*0.02,),
          CustomElevatedButton(textButton: AppLocalizations.of(context)!.createAccount, onPressed: () {  },),
          SizedBox(height: height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.alreadyHaveAccount,style:!themeProvider.isDark()? AppStyles.blackMed16:AppStyles.beigeMed16,),
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text(AppLocalizations.of(context)!.login,style: AppStyles.blueBold16,))
            ],
          ),
          SizedBox(height: height*0.02,),
          CustomToggleSwitch()
        ],),),
    );
  }
}
