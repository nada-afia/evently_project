import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/app_them_provider.dart';

class EventTab extends StatelessWidget {
   EventTab({super.key,
     required this.eventName, required this.isSelected,
     required this.selectedColor, required this.borderColor,
     required this.selectedText, required this.unSelectedText});
   final String eventName;
   final bool isSelected;
   final Color borderColor;
  final Color  selectedColor;
  final TextStyle? selectedText;
  final TextStyle ?unSelectedText;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.01
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
        vertical: height*0.005
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color:isSelected?selectedColor:AppColors.transparent ,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Text(eventName,style:isSelected? selectedText:unSelectedText,),
    );
  }
}
