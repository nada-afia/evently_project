import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';

import '../utilts/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String textButton;
   final Color?  bgColor;
   final TextStyle? textStyle;
    final VoidCallback onPressed;
   final bool hasIcon;
   final Widget? iconWidget;
    CustomElevatedButton({super.key
      ,required this.textButton,
      this.bgColor,this.textStyle,
      required this.onPressed,
    this.hasIcon=false,
      this.iconWidget
    });

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor??AppColors.blue,
         side: BorderSide(
           color: AppColors.blue,
         ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal:width*0.04, vertical:height*0.02),
        ),
        onPressed: onPressed,
        child: !hasIcon?
        Text(textButton,style:textStyle?? AppStyles.naturalWhiteMed20,):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             iconWidget!,
            SizedBox(width: width*0.01,),
            Text(textButton,style:textStyle?? AppStyles.naturalWhiteMed20,)
          ],
        ),
      ),
    );
  }
}
