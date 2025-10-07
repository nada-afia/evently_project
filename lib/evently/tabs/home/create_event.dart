import 'package:evently_app/evently/custom_Icon_container.dart';
import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/evently/tabs/home/widget/create_event_data.dart';
import 'package:evently_app/evently/tabs/home/widget/date_or_time.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../provider/event_list_provider.dart';
import '../../../utilts/app_styles.dart';
import 'widget/event_tab.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selected=0;
  final _formKey=GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<String> imageEvents = [
    AppImages.sport,
    AppImages.birthday,
    AppImages.meeting,
    AppImages.gaming,
    AppImages.workShop,
    AppImages.bookClub,
    AppImages.exhibition,
    AppImages.holiday,
    AppImages.eating
  ];
  final List<String> imageEventsDark = [
    AppImages.sportDark,
    AppImages.birthdayDark,
    AppImages.meetingDark,
    AppImages.gamingDark,
    AppImages.workShopDark,
    AppImages.bookClubDark,
    AppImages.exhibitionDark,
    AppImages.holidayDark,
    AppImages.eatingDark
  ];
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemProvider>(context);
     var width=MediaQuery.of(context).size.width;
     var height=MediaQuery.of(context).size.height;
     final List<String> eventsName = [
       AppLocalizations.of(context)!.sport,
       AppLocalizations.of(context)!.birthday,
       AppLocalizations.of(context)!.meeting,
       AppLocalizations.of(context)!.gaming,
       AppLocalizations.of(context)!.workshop,
       AppLocalizations.of(context)!.bookClub,
       AppLocalizations.of(context)!.exhibition,
       AppLocalizations.of(context)!.holiday,
       AppLocalizations.of(context)!.eating,

     ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: width*0.20 ,
        title: Center(child: Text(AppLocalizations.of(context)!.createevent)),
        foregroundColor: AppColors.blue,
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: width*0.04),
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width*0.9,
                  height: height*0.24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(image: AssetImage(!themeProvider.isDark()?imageEvents[selected]:imageEventsDark[selected],),fit: BoxFit.cover)
                  ),
                ),
                DefaultTabController(length: eventsName.length,
                    child:TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        indicatorColor:AppColors.transparent ,
                        dividerColor: AppColors.transparent,
                        onTap: (index) {
                          selected=index;
                          setState(() {

                          });
                        },
                        tabs:eventsName.map((eventName) =>
                            EventTab(eventName: eventName, isSelected:selected==eventsName.indexOf(eventName),
                              selectedColor: AppColors.blue, borderColor: AppColors.blue, selectedText:Theme.of(context).textTheme.labelMedium,unSelectedText: AppStyles.blueMed16,),).toList()

                    )
                ),
                Text(AppLocalizations.of(context)!.title,style:Theme.of(context).textTheme.titleLarge),
                CustomTextField(hintText: AppLocalizations.of(context)!.eventTitle,hintStyle: Theme.of(context).textTheme.labelSmall,
                    prefixIcon:Image.asset(AppImages.noteEDiting,), validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a title";
                    }
                    return null;
                  },controller: titleController,),
                SizedBox(height: height*0.02,),
                Text(AppLocalizations.of(context)!.description,style:Theme.of(context).textTheme.titleLarge),
                CustomTextField(hintText: AppLocalizations.of(context)!.eventDescription,
                  hintStyle:Theme.of(context).textTheme.labelSmall,maxLines: 4, validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  }, controller: descriptionController,
                ),
                SizedBox(height: height*0.02,),
                DateOrTime(image: AppImages.calender,
                    firstText: AppLocalizations.of(context)!.eventDate,
                    secondText: AppLocalizations.of(context)!.chooseDate, isDate: true,),
                SizedBox(height: height*0.02,),
            DateOrTime(image: AppImages.time,
                firstText: AppLocalizations.of(context)!.eventTime,
                secondText: AppLocalizations.of(context)!.chooseTime, isDate: false,),
                SizedBox(height: height*0.02,),
                Text(AppLocalizations.of(context)!.location,style:Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: height*0.02,),
                CustomElevatedButton(textButton:AppLocalizations.of(context)!.chooseEventLocation,hasIcon: true,
                   bgColor: AppColors.transparent,

                    iconWidget: Row(
                      children: [
                     CustomIconContainer(image: AppImages.locationIcon)
                        , SizedBox(width: width*0.02,),
                        Text(AppLocalizations.of(context)!.chooseEventLocation,style:AppStyles.blueMed16),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blue,)
                      ],
                    ),
                    onPressed: (){}),
                SizedBox(height: height*0.02,),
                CustomElevatedButton(onPressed: (){add();},textButton: AppLocalizations.of(context)!.addEvent,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void add() {
    if (_formKey.currentState?.validate() == true) {
      final newEvent = CreateEventModel(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        image: imageEvents[selected],
      );


      Provider.of<EventListProvider>(context,listen: false).addEvent(newEvent);
      Navigator.of(context).pop();
    }
  }
}
