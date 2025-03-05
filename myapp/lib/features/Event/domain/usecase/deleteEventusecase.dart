import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Deleteeventusecase {
  final Eventrepository eventrepository;
  Deleteeventusecase(this.eventrepository);

  Future<void> deleteEvent(String id) {
    return eventrepository.deleteEvent(id);
  }
}
