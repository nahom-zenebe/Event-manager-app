import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Createeventusecase {
  final Eventrepository eventrepository;
  Createeventusecase(this.eventrepository);

  Future<Event> createEvent(Event event) {
    return eventrepository.createEvent(event);
  }
}
