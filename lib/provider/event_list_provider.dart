import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/utilts/app_color.dart';
import 'package:evently_app/utilts/app_toast.dart';
import 'package:flutter/material.dart';
import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';

class EventListProvider extends  ChangeNotifier{
  List<Event>eventList=[];
  List<Event>filterEventList=[];
  List<String>eventsName=[];
  List<Event>favEventsList=[];
  int selectedIndex=0;
  List<String> getEventNameList(BuildContext context){
    return eventsName = [
      AppLocalizations.of(context)!.all,
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
  }
  Future<void> getAllEvents() async {
    QuerySnapshot<Event>querySnapshot=await FirebaseUtils.getEventCollection().get();
    eventList = querySnapshot.docs.map((doc) {
      return doc.data();
    } ).toList();
    filterEventList=eventList;
    filterEventList.sort((event1, event2) {
      return event1.eventDateTime.compareTo(event2.eventDateTime);
    },);
  notifyListeners();
  }
 Future<void> getFilterEvents() async {
  QuerySnapshot<Event>queryFilter =await FirebaseUtils.getEventCollection().get();
  eventList =  queryFilter.docs.map((doc) {
    return doc.data();
  },).toList();
  filterEventList  =eventList.where((event){
  return event.eventName==eventsName[selectedIndex];
},).toList();
  filterEventList.sort((event1, event2) {
    return event1.eventDateTime.compareTo(event2.eventDateTime);
  },);
  notifyListeners();
  }
  void updateFavorite(Event event){
    FirebaseUtils.getEventCollection().doc(event.id)
        .update({'isFavorite':!event.isFavorite});
          AppToast.showToastMsg(message: "Event Update Successfully",
              backgroundColor: Colors.green,
              textColor: AppColors.white);
    selectedIndex==0?getAllEvents():getFilterEvents();
    notifyListeners();
  }
  Future<void> getAllFavorite() async {
    QuerySnapshot<Event>queryFavorite =await FirebaseUtils.
    getEventCollection().get();
    eventList =queryFavorite.docs.map((doc) {
 return doc.data();
    } ,).toList();
    favEventsList =eventList.where((event) {
 return event.isFavorite==true;
    },).toList();
    selectedIndex==0 ? getAllEvents():getFilterEvents();
    getAllFavorite();
    notifyListeners();
  }
  Future<void> updateEventData(Event event) async {

    await FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update(event.toFireStore());
    AppToast.showToastMsg(
      message: "Event Data Updated Successfully",
      backgroundColor: Colors.green,
      textColor: AppColors.white,
    );
    selectedIndex == 0 ? await getAllEvents() : await getFilterEvents();
    notifyListeners();

  }
  void deleteEvent(Event event){
    FirebaseUtils.getEventCollection().doc(event.id).delete();
    selectedIndex==0 ? getAllEvents():getFilterEvents();
    notifyListeners();
  }
  void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex==0 ? getAllEvents():getFilterEvents();
    notifyListeners();
 }

}
