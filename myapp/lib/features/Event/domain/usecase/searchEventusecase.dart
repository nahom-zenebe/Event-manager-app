import '../repository/eventrepository.dart';
import '../entities/event.dart';

class Searcheventusecase {
  final Eventrepository eventrepository;

  Searcheventusecase(this.eventrepository);

  Future<List<Event>> searchEvent(
      {String? title, String? location, String? category, String? organizer}) {
    return eventrepository.searchEvent(
      title: title,
      location: location,
      category: category,
      organizer: organizer,
    );
  }
}
