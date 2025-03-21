part of 'event_bloc.dart';

abstract class EventEvent {}

class CreateEvent extends EventEvent {

  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final DateTime startDate;
  final DateTime endDate;

  CreateEvent({
    required this.title,
    required this.location,
    required this.category,
    required this.image,
    required this.organizer,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props =>
      [title, location, category, image, organizer, startDate, endDate];
}


class DeleteEvent extends EventEvent {
  final String id;

  DeleteEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetAllEvents extends EventEvent {}

class UpdateEvent extends EventEvent {
  final String id;
  final String title;
  final String location;
  final String category;
  final String image;
  final String organizer;
  final DateTime startDate;
  final DateTime endDate;

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

  @override
  List<Object?> get props =>
      [id, title, location, category, image, organizer, startDate, endDate];
}

// 📌 Search Event
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

  @override
  List<Object?> get props => [title, location, category, organizer];
}

class Addtocart extends EventEvent {
  final Event event;

  Addtocart({required this.event});
}

class Removefromcart extends EventEvent {
  final String Eventid;

  Removefromcart({required this.Eventid});
}
