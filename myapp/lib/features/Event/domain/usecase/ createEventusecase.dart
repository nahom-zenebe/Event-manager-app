import '../repository/eventrepository.dart';
import '../entities/event.dart';

class createeventusecase {
  final Eventrepository eventrepository;
  createeventusecase(this.eventrepository);

  Future<Event> createEvent(Event event) {
    return eventrepository.createEvent(event);
  }
}
