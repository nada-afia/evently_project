import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({required BuildContext context,required String message}) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(color: AppColors.blue,),
              SizedBox(width: 20,),
              Text(message,style: AppStyles.blackMed16,),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  static void  showMessage({required BuildContext context,
    required String message,
    String ?title,
String ?posActionName,
    Function? posAction,
    String ?negPosActionName,
    Function? negPosAction,
  }){
    List<Widget>actions=[];
    if(posActionName!=null){
      actions.add(TextButton(onPressed:(){
        Navigator.pop(context);
        posAction?.call();
      }, child:Text(posActionName,style: AppStyles.blueMed16)));
    }
    if(negPosActionName!=null){
      actions.add(TextButton(onPressed:(){
        Navigator.pop(context);
        negPosAction?.call();
      }, child:Text(negPosActionName,style: AppStyles.blueMed16)));
    }
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Text(message,style: AppStyles.blackMed16,),
        title: Text(title??' ',style: AppStyles.blackMed16,) ,
        actions:actions,
      );
    },);
  }

}