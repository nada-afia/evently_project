 import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrTime extends StatelessWidget {
  final String iconName;
  final  String eventDateOrTime;
  final VoidCallback onChooseEventOrDate;
  final String onChooseDateOrTime;
   const DateOrTime({super.key, required this.iconName, required this.eventDateOrTime, required this.onChooseEventOrDate, required this.onChooseDateOrTime});

   @override
   Widget build(BuildContext context) {
     var height=MediaQuery.of(context).size.height;
     var width=MediaQuery.of(context).size.width;

     return Row(children: [
           Image.asset(iconName),
        SizedBox(width: width*0.04,),
       Text( eventDateOrTime,style: Theme.of(context).textTheme.titleLarge,),
       Spacer(),
       TextButton(onPressed: onChooseEventOrDate, child: Text(onChooseDateOrTime,style:  AppStyles.blueMed16,))
     ],);
   }
 }
