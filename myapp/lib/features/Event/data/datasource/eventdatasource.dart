import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/eventmodel.dart';
import 'package:intl/intl.dart';

class EventDataSource {
  final String baseApi = "http://localhost:5002/api/event";

  Future<EventModel> createEvent(String title, String location, String category,
      String image, String organizer, DateTime startDate, DateTime endDate) async {

         String formattedStartDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(startDate);
  String formattedEndDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(endDate);


    final response = await http.post(
      Uri.parse("$baseApi/createevent"),
      body: jsonEncode({
        'title': title,
        'location': location,
        'category': category,
        'image': image,
        'organizer': organizer,
        'startDate': formattedStartDate,
        'endDate': formattedEndDate
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Event creation failed");
    }
  }

  Future<void> deleteEvent(String id) async {
    final response = await http.delete(
      Uri.parse("$baseApi/deleteevent/$id"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 204) {
      print("Event deleted successfully");
    } else {
      throw Exception("Event deletion failed");
    }
  }

  Future<EventModel> updateEvent(String id, String title, String location, String category,
      String image, String organizer,DateTime startDate, DateTime endDate) async {

  String formattedStartDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(startDate);
  String formattedEndDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(endDate);



    final response = await http.put(
      Uri.parse("$baseApi/updateevent/$id"),
      body: jsonEncode({
        'title': title,
        'location': location,
        'category': category,
        'image': image,
        'organizer': organizer,
        'startDate': formattedStartDate,
        'endDate': formattedEndDate 
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return EventModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Event update failed");
    }
  }

  Future<List<EventModel>> getAllEvents() async {
    final response = await http.get(Uri.parse("$baseApi/event/getallevents"));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => EventModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch events");
    }
  }

  Future<List<EventModel>> searchEvent({
    String? title,
    String? location,
    String? category,
    String? organizer,
  }) async {
    final response = await http.get(
      Uri.parse(
        "$baseApi/searchevent?title=${title ?? ''}&location=${location ?? ''}&category=${category ?? ''}&organizer=${organizer ?? ''}",
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => EventModel.fromJson(json)).toList();
    } else {
      throw Exception("Event search failed");
    }
  }
}
