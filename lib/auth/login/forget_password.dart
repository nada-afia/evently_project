import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed:(){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back,color: AppColors.blue,)),
        title: Center(child: Text(AppLocalizations.of(context)!.forgetPassword,style: AppStyles.blueMed20)),
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal:width*0.04 ),
        child: Column(
          children: [
           Image.asset(AppImages.changeSetting),
            SizedBox(height: height*0.02,),
            CustomElevatedButton(textButton: AppLocalizations.of(context)!.resetPassword, onPressed: () {  },)
          ],
        ),
      ),
    );
  }
}
