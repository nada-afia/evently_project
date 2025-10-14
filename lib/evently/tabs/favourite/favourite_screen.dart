import 'package:evently_app/provider/event_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utilts/app_color.dart';
import '../../../utilts/app_styles.dart';
import '../../custom_text_field.dart';
import '../home/widget/event_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late EventListProvider eventListProvider;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      eventListProvider.getAllFavorite();
    },);

  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    eventListProvider=Provider.of<EventListProvider>(context);

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
            Expanded(child:eventListProvider.favEventsList.isEmpty?Center(child: Text(AppLocalizations.of(context)!.noFavoriteEventFound,style: AppStyles.blackBold20,),): ListView.builder(
                itemBuilder: (context, index) {
                  return EventItem(event: eventListProvider.favEventsList[index]);
                },
                itemCount: eventListProvider.favEventsList.length)),
          ],
        ),
      ),
    );
  }
}
