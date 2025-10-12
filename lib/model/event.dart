class Event{
  static const String collectionName='Events';
  String id;
  String title;
  String description;
  String eventImage;
  String eventName;
  DateTime eventDateTime;
  String eventTime;
  bool isFavorite;
  Event({this.id='',
    required this.title,
    required this.description,
    required this.eventImage,
    required this.eventName,
    required this.eventTime,
    required this.eventDateTime,
    this.isFavorite=false,

  });
  Event.fromDireStore(Map<String,dynamic> data):this(
    id: data['id'] ?? '',
    title: data['title'] ?? '',
    description: data['description'] ?? '',
    eventName: data['eventName'] ?? '',
    eventImage: data['eventImage'] ?? '',
    eventTime: data['eventTime'] ?? '',
    eventDateTime: data['eventDateTime'] != null
        ? DateTime.fromMillisecondsSinceEpoch(data['eventDateTime'])
        : DateTime.now(),
    isFavorite: data['isFavorite'] ?? false,
  );
  Map<String,dynamic> toFireStore(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'eventName':eventName,
      'eventImage':eventImage,
      'eventDateTime':eventDateTime.millisecondsSinceEpoch,
      'eventTime':eventTime,
      'isFavorite':isFavorite,
    };
  }

}