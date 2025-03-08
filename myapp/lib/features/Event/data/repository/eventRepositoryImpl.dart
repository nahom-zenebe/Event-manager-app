import '../../domain/entities/event.dart';
import '../../domain/repository/eventrepository.dart';
import '../datasource/eventdatasource.dart';
import '../model/eventmodel.dart';

class EventRepositoryImpl implements Eventrepository {
  final EventDataSource eventDataSource;

  EventRepositoryImpl(this.eventDataSource);

  @override
  Future<Event> createEvent(Event event) async {
    return eventDataSource.createEvent(
            
  event.title,
  event.location,
  event.category,
  event.image,
  event.organizer, 
  event.startDate,
  event.endDate,
);


  }

  @override
  Future<void> deleteEvent(String id) async {
    await eventDataSource.deleteEvent(id);
  }

  @override
  Future<List<Event>> getallEvents() async {
    return await eventDataSource.getAllEvents();
  }

  @override
  Future<Event> updateEvent(String id, Event event) async {
    return eventDataSource.updateEvent(
      id,
      event.title,
      event.location,
       event.category,
      event.image,
      event.organizer, 
      event.startDate,
      event.endDate,
    );
  }

  @override
  Future<List<Event>> searchEvent({
    
    String? title,
    String? location,
    String? category,
    String? organizer,
  }) async {
    return await eventDataSource.searchEvent(
      title: title,
      location: location,
      category: category,
      organizer: organizer,
    );
  }
}
