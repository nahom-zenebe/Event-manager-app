import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Updateeventusecase {
  final Eventrepository eventrepository;

  Updateeventusecase(this.eventrepository);

  Future<Event> updateEvent(String id, Event event) {
    return eventrepository.updateEvent(id, event);
  }
}
