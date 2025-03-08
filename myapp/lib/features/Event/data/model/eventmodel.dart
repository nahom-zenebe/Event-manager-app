import '../../domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required String id,
    required String title,
    required String location,
    required String category,
    required String image,
    required String organizer,
    required DateTime startDate,
    required DateTime endDate,
  }) : super(
             id :id,
          title: title,
          location: location,
          category: category,
          image: image,
          organizer: organizer,
          startDate: startDate,
          endDate: endDate,
        );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id:json["id"] ?? "",
      title: json["title"] ?? "",
      location: json["location"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? " ",
      organizer: json["organizer"] ?? " ",
      startDate: json["startDate"] != null ? DateTime.parse(json["startDate"]) : DateTime.now(),
      endDate: json["endDate"] != null ? DateTime.parse(json["endDate"]) : DateTime.now(),
    );
  }
}
