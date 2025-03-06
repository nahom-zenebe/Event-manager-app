

abstract class EventEvent {}

class CreateEvent extends EventEvent {
  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final String startDate;
  final String endDate;

  CreateEvent({
    required this.title,
    required this.location,
    required this.category,
    required this.image,
    required this.organizer,
    required this.startDate,
    required this.endDate,
  });
}

class DeleteEvent extends EventEvent {
  final String id;

  DeleteEvent({required this.id});
}

class GetAllEvents extends EventEvent {
  GetAllEvents();
}

class UpdateEvent extends EventEvent {
  final String id;
  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final String startDate;
  final String endDate;

  UpdateEvent({
    required this.id,
    required this.title,
    required this.location,
    required this.category,
    required this.image,
    required this.organizer,
    required this.startDate,
    required this.endDate,
  });
}

class SearchEvent extends EventEvent {
  final String title;
  final String location;
  final String category;
  final String organizer;

  SearchEvent({
    required this.title,
    required this.location,
    required this.category,
    required this.organizer,
  });
}
