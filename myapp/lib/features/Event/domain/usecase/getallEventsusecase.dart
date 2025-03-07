import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Getalleventsusecase {
  final Eventrepository eventrepository;
  Getalleventsusecase(this.eventrepository);

  Future<List<Event>>getallEvent(String someParameter) {
    return eventrepository.getallEvents();
  }
}
