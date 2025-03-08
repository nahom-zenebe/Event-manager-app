class Event {
  final String title;
  final String location;
  final String category; 
  final String image;
  final String organizer;
  final DateTime startDate; 
  final DateTime endDate; 

  Event({
    required this.title,
    required this.location,
    required this.category,
    required this.image,
    required this.organizer,
    required this.startDate,
    required this.endDate,
  });
}
