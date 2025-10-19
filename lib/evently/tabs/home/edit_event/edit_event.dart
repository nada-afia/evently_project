import 'package:evently_app/evently/tabs/home/added_event/widget/date_or_time.dart';
import 'package:evently_app/evently/tabs/home/widget/event_tab.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/provider/event_list_provider.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/event.dart';
import '../../../../provider/app_them_provider.dart';
import '../../../../utilts/app_color.dart';
import '../../../../utilts/app_images.dart';
import '../../../custom_Icon_container.dart';
import '../../../custom_elevated_button.dart';
import '../../../custom_text_field.dart';
class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  int selected=0;
  DateTime?selectedDate;
  String formateDate='';
  TimeOfDay? selectedTime;
  String formateTime='';
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Event;
    final event = args;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var listProvider=Provider.of<EventListProvider>(context);
    var themeProvider=Provider.of<AppThemProvider>(context);

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
    if (titleController.text.isEmpty) {
      titleController.text = event.title;
      descController.text = event.description;
      selectedDate = event.eventDateTime;
      selectedTime = TimeOfDay.fromDateTime(event.eventDateTime);
      formateTime = selectedTime!.format(context);
      selected = eventsName.indexOf(event.eventName);
    }
    return Scaffold(
      appBar: AppBar(
        titleSpacing: width*0.24 ,
        title: Text(AppLocalizations.of(context)!.editEvent,style: AppStyles.blueMed16,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal:width*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container(
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
                        // Navigator.of(context).pushNamed(AppRoutes.createEventScreen,arguments: selected);
                      },
                      tabs:eventsName.map((eventName) =>
                          EventTab(eventName: eventName, isSelected:selected==eventsName.indexOf(eventName),
                            selectedColor: AppColors.blue, borderColor: AppColors.blue, selectedText:Theme.of(context).textTheme.labelMedium,unSelectedText: AppStyles.blueMed16,),).toList()

                  )
              ),
              Text(AppLocalizations.of(context)!.title,style:Theme.of(context).textTheme.titleLarge),
              CustomTextField( controller: titleController, hintText: event.title,hintStyle: Theme.of(context).textTheme.labelSmall,
                prefixIcon:Image.asset(AppImages.noteEDiting,), validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a title";
                  }
                  return null;
                },),
              SizedBox(height: height*0.02,),
              Text(AppLocalizations.of(context)!.description,style:Theme.of(context).textTheme.titleLarge),
              CustomTextField(controller: descController,hintText: event.description,
                hintStyle:Theme.of(context).textTheme.labelSmall,maxLines: 4, validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a description";
                  }
                  return null;
                },
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
              CustomElevatedButton(
                onPressed: () {
                    event.title = titleController.text;
                  event.description = descController.text;
                  if (selectedDate != null && selectedTime != null) {
                    event.eventDateTime = DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedTime!.hour,
                      selectedTime!.minute,
                    );
                  }
                 event.eventName = eventsName[selected];
                   event.eventImage = imageEvents[selected];
                  listProvider.updateEventData(event);
                  Navigator.pop(context);
                },
                textButton: AppLocalizations.of(context)!.updateEvent,
              ),

            ],

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
}
