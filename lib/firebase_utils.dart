import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/event.dart';

class FirebaseUtils{
  static CollectionReference<Event> getEventCollection(){
     return FirebaseFirestore.instance.collection(Event.collectionName).
  withConverter<Event>(
    fromFirestore: (snapshot, options) => Event.fromDireStore(snapshot.data()!),
    toFirestore:(event, options) => event.toFireStore(),);}
  static Future<void> addEventToFIreStore(Event event){
    CollectionReference<Event> collectionRef  = getEventCollection();
    DocumentReference<Event> documentRef  = collectionRef.doc();
     event.id = documentRef.id;
      return documentRef.set(event);
  }

}