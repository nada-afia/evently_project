import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/app_them_provider.dart';

class EventItem extends StatelessWidget {
    EventItem({super.key, required this.isLiked, required this.image});
   final bool isLiked;
   final String image;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemProvider>(context);
    return Container(
      height: height*0.24,
      width: width*0.92,
      margin: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.01
      ),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.blue,
          width: 2
        )
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width*0.02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).dividerColor
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("21",style: AppStyles.blueBold20,),
                  Text('Nov',style: AppStyles.blueBold14,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width*0.02,
                vertical: height*0.01
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).dividerColor
              ),
              child:  Row(
                children: [
                  Text('This is a Birthday Party ',style:themeProvider.isDark()?AppStyles.beigeBold14:AppStyles.blackBold14,),
                  Spacer(),
                  Icon(isLiked?Icons.favorite:Icons.favorite_outline,color: AppColors.blue,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
