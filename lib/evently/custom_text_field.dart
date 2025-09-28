import 'package:evently_app/utilts/app_color.dart';
import 'package:flutter/material.dart';
import '../utilts/app_styles.dart';
typedef onValidator =String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  Color borderColor;
  String? hintText;
  TextStyle?hintStyle;
  Widget?prefixIcon;
  Widget?suffixIcon;
  onValidator ? validator;
  TextInputType?keyboardType;
  TextEditingController? controller;
   bool obscureText;
  CustomTextField({super.key,
    this.borderColor=AppColors.grey,
    this.hintStyle,this.hintText,
    this.prefixIcon
    ,this.suffixIcon,
    this.validator,
    this.keyboardType=TextInputType.text,
    this.obscureText=false,
     this.controller
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText,
     controller: controller,
     keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder:  buildOut(borderColor: borderColor),
        focusedBorder: buildOut(borderColor: borderColor),
        errorBorder: buildOut(borderColor: AppColors.red),
        focusedErrorBorder:buildOut(borderColor: AppColors.red) ,
        hintText: hintText,
        hintStyle: hintStyle?? AppStyles.greyMed16 ,
        prefixIcon:prefixIcon,
        suffixIcon: suffixIcon,

      ),
    );
  }
  OutlineInputBorder buildOut({required Color borderColor }){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: borderColor,
          width: 1,
        )
    );
  }
}