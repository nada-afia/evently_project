import 'package:flutter/material.dart';

import '../utilts/app_color.dart';
class CustomIconContainer extends StatelessWidget {
  const CustomIconContainer({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Container(
      width: width*0.12,
      height: height*0.05,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(8),
        color: AppColors.blue,
      ),
      child: Image.asset(image,color: Theme.of(context).cardColor,),
    );
  }
}
