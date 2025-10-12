import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';

class EventListProvider extends  ChangeNotifier{
  List<Event>eventList=[];
  List<Event>filterEventList=[];
  List<String>eventsName=[];
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
 void changeSelectedIndex(int newSelectedIndex){
    selectedIndex=newSelectedIndex;
    selectedIndex==0 ? getAllEvents():getFilterEvents();
    notifyListeners();
 }

}
