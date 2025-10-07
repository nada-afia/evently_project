import 'package:evently_app/evently/custom_Icon_container.dart';
import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.blue,

        title: Center(child: Text(AppLocalizations.of(context)!.eventDetails)),
        actions: [
              IconButton(onPressed: (){Navigator.of(context).pushNamed(AppRoutes.editScreen);}, icon: Image.asset(AppImages.edit)),
              IconButton(onPressed: (){}, icon: Image.asset(AppImages.delete)),
        ],
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal:width*0.04),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              width: width*0.9,
              height: height*0.24,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: AssetImage( AppImages.birthday),fit: BoxFit.cover)
              ),
            ),
            SizedBox(height: height*0.01,),
            Text(AppLocalizations.of(context)!.weAreGoing,style: AppStyles.blueMed24,),
            SizedBox(height: height*0.01,),
            CustomElevatedButton(onPressed: (){}
              ,hasIcon: true,bgColor: AppColors.transparent,
              iconWidget: Row(
                children: [
                 CustomIconContainer(image: AppImages.calender),
                  SizedBox(width: width*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("21 November 2024",style: AppStyles.blueMed16,),
                      Text("12:12PM",style: Theme.of(context).textTheme.titleLarge,)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            CustomElevatedButton(textButton:AppLocalizations.of(context)!.chooseEventLocation,hasIcon: true,
                bgColor: AppColors.transparent,
          
                iconWidget: Row(
                  children: [
                    CustomIconContainer(image: AppImages.locationIcon)
                    , SizedBox(width: width*0.02,),
                    Text("Cairo ,Egypt",style:AppStyles.blueMed16),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blue,)
                  ],
                ),
                onPressed: (){}),
            SizedBox(height: height*0.02,),
            Container(
              width: width*0.9,
              height: height*0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.blue,
                    width: 1
                  ),
                  image: DecorationImage(image: AssetImage( AppImages.mapDetails),fit: BoxFit.cover)
              ),
            ),
            SizedBox(height: height*0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(AppLocalizations.of(context)!.description,style:Theme.of(context).textTheme.titleLarge ,),
             SizedBox(height: height*0.01,),
             Text("Lorem ipsum dolor sit amet consectetur. Vulputate eleifend suscipit eget neque senectus a. Nulla at non malesuada odio duis lectus amet nisi sit. Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. Iaculis eget quis ut amet. Sit ac malesuada nisi quis  feugiat.",style: Theme.of(context).textTheme.titleLarge,) ]
              ,)
          ],
          ),
        ),
      ),
    );
  }
}
