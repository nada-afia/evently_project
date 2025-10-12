import 'package:evently_app/evently/custom_Icon_container.dart';
import 'package:evently_app/evently/custom_elevated_button.dart';
import 'package:evently_app/evently/custom_text_field.dart';
import 'package:evently_app/evently/tabs/home/widget/date_or_time.dart';
import 'package:evently_app/firebase_utils.dart';
import 'package:evently_app/model/event.dart';
import 'package:evently_app/provider/app_them_provider.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../provider/event_list_provider.dart';
import '../../../utilts/app_styles.dart';
import 'widget/event_tab.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selected=0;
  String selectedEventName='';
  String selectedEventImage='';
  DateTime?selectedDate;
  String formateDate='';
  TimeOfDay? selectedTime;
  String formateTime='';
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
  late EventListProvider eventListProvider;
  @override
  Widget build(BuildContext context) {
     eventListProvider=Provider.of<EventListProvider>(context);
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
                    initialIndex: 0,
                    child:TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        indicatorColor:AppColors.transparent ,
                        dividerColor: AppColors.transparent,
                        onTap: (index) {
                          selected=index;
                          selectedEventName = eventsName[index];
                          selectedEventImage = !themeProvider.isDark()
                              ? imageEvents[index]
                              : imageEventsDark[index];
                          setState(() {

                          });
                        },
                        tabs:eventsName.map((eventName) =>
                            EventTab(eventName: eventName,
                              isSelected:selected==eventsName.indexOf(eventName),
                              selectedColor: AppColors.blue,
                              borderColor: AppColors.blue,
                              selectedText:Theme.of(context).textTheme.labelMedium,
                              unSelectedText: AppStyles.blueMed16,),).toList()

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
                DateOrTime(iconName:AppImages.calender,
                    eventDateOrTime:  AppLocalizations.of(context)!.eventDate,
                    onChooseEventOrDate: chooseDate,
                    onChooseDateOrTime:  selectedDate==null?AppLocalizations.of(context)!.chooseDate:'${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
                SizedBox(height: height*0.02,),
                DateOrTime(iconName: AppImages.time,
                    eventDateOrTime: AppLocalizations.of(context)!.eventTime,
                    onChooseEventOrDate: chooseTime,
                    onChooseDateOrTime: selectedTime==null?AppLocalizations.of(context)!.chooseTime:formateTime),
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
                CustomElevatedButton(onPressed: (){addEvent();},textButton: AppLocalizations.of(context)!.addEvent,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  chooseDate() async {
    var chooseDate=  await showDatePicker(context: context,initialDate: DateTime.now(),
      firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectedDate=chooseDate;
    setState(() {

    });
  }

  chooseTime() async {
    var chooseTime=  await  showTimePicker(context: context,
        initialTime: TimeOfDay.now()
    );
    selectedTime=chooseTime;
    if(selectedTime!=null){
      formateTime=selectedTime!.format(context);
      setState(() {

      });
    }
  }
  void addEvent() async {
    if (_formKey.currentState?.validate() == true) {
      Event newEvent = Event(
        title: titleController.text,
        description: descriptionController.text,
        eventImage: selectedEventImage,
        eventName: selectedEventName,
        eventTime: formateTime,
        eventDateTime: selectedDate!,
      );
       FirebaseUtils.addEventToFIreStore(newEvent).timeout(Duration(seconds: 1)
       ,onTimeout: (){
              print('data');
              eventListProvider.getAllEvents();
              Navigator.pop(context);
           }
       );
    }
  }

}
