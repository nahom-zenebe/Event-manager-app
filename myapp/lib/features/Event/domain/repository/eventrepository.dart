import '../entities/event.dart';

abstract class Eventrepository {
  Future<Event> createEvent(Event event);
  Future<List<Event>> getallEvents();
  Future<void> deleteEvent(String id);
  Future<Event> updateEvent(String id, Event event);
  Future<List<Event>> searchEvent({String? title, String? location, String? category, String? organizer});
}
