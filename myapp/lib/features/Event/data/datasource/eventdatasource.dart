import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/eventmodel.dart';

class Eventdatasource {
  final BaseApi = "http://localhost:5000/api/event";

  Future<EventModel> createEvent(String title, String location, String Category,
      String image, String orgnaizer, String Startdate, String Enddate) async {
    final response = await http.post(Uri.parse("$BaseApi/createevent"),
    body: jsonEncode(
          {'title': title, 'location': location, 'Category': Category, 'image':image,'orgnaizer':orgnaizer,'Startdate':Startdate,'Enddate':Enddate}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return EventModel.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception("signup Failed");
    }
  }
}
