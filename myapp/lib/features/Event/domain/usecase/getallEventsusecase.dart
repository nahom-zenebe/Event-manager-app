import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Getalleventsusecase {
  final Eventrepository eventrepository;
  Getalleventsusecase(this.eventrepository);

  Future<void> deleteEvent(String id) {
    return eventrepository.deleteEvent(id);
  }
}
