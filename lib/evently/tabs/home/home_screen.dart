import 'package:evently_app/evently/tabs/home/widget/event_item.dart';
import 'package:evently_app/evently/tabs/home/widget/event_tab.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_images.dart';
import 'package:evently_app/utilts/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/app_them_provider.dart';
import '../../../provider/event_list_provider.dart';

class HomeScreen extends StatefulWidget {
  final String? name;

  const HomeScreen({super.key,this.name});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isLiked=false;
  @override
  Widget build(BuildContext context) {

    var eventListProvider=Provider.of<EventListProvider>(context);
    var themeProvider = Provider.of<AppThemProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if(eventListProvider.eventList.isEmpty){
      eventListProvider.getAllEvents();}
    eventListProvider.getEventNameList(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,

          ),
        ),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.welcomeBack,style:!themeProvider.isDark()?AppStyles.whiteReg14:AppStyles.beigeReg14,),
                Text(widget.name!.split('@').first,style:Theme.of(context).textTheme.titleMedium,),
              ],
            ),
            Spacer(),
            Image.asset(AppImages.sunImage),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.02),
              decoration: BoxDecoration(
                  color:themeProvider.isDark()?AppColors.beige:AppColors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding:   EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.011),
                child: Text("En",style: AppStyles.blueBold14,),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
            height: height*0.15,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(AppImages.map),
                    SizedBox(width: width*0.01,),
                    Text(AppLocalizations.of(context)!.cairo,style: AppStyles.whiteMed14,)
                  ],
                ),
                DefaultTabController(length: eventListProvider.eventsName.length,
                    child:TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        indicatorColor:AppColors.transparent ,
                        dividerColor: AppColors.transparent,
                        onTap: (index) {
                          eventListProvider.changeSelectedIndex(index);
                        },
                        tabs:eventListProvider.eventsName.map((eventName) =>
                            EventTab(eventName: eventName,
                              isSelected:eventListProvider.selectedIndex==eventListProvider.eventsName.indexOf(eventName),
                              selectedColor: Theme.of(context).focusColor,
                              borderColor: Theme.of(context).focusColor,),).toList()

                    )
                ),
              ],
            ),
          ),
          Expanded
            (child:eventListProvider.filterEventList.isEmpty?Center(child: Text(AppLocalizations.of(context)!.noEvent,style: Theme.of(context).textTheme.headlineSmall,),): ListView.builder(
              itemBuilder: (context, index) {
                return EventItem( event: eventListProvider.filterEventList[index],);
              },
              itemCount: eventListProvider.filterEventList.length))
        ],
      ),
    );
  }

}