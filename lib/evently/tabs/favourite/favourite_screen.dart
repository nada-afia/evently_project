import 'package:evently_app/utilts/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utilts/app_color.dart';
import '../../../utilts/app_styles.dart';
import '../../custom_text_field.dart';
import '../home/widget/event_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
              child: CustomTextField(
                prefixIcon: Icon(Icons.search, color: AppColors.blue),
                hintText: AppLocalizations.of(context)!.searchforevent,
                hintStyle: AppStyles.blueBold14,
                borderColor: AppColors.blue,
              ),
            ),
            Expanded(child: ListView.builder(
                itemBuilder: (context, index) {
                  return EventItem(isLiked: true, image: AppImages.holiday,);
                },
                itemCount: 20)),
          ],
        ),
      ),
    );
  }
}
