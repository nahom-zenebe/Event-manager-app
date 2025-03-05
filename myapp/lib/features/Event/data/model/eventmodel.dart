import '../../domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required String title,
    required String location,
    required String category,
    required String image,
    required String organizer,
    required String startDate,
    required String endDate,
  }) : super(
          title: title,
          location: location,
          Category: category,
          image: image,
          orgnaizer: organizer,
          Startdate: startDate,
          Enddate: endDate,
        );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        title: json["title"],
        location: json["location"],
        category: json["category"],
        image: json["image"],
        organizer: json["organizer"],
        startDate: json["startDate"],
        endDate: json["endDate"]);
  }
}
