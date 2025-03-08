import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usermodel.dart';

class UserDatasource {
  final String BaseUrl = "http://localhost:5002/api/auth";

  Future<Usermodel> signup(
      String name, String email, String password, String role) async {
    final response = await http.post(
      Uri.parse("$BaseUrl/register"),
      body: jsonEncode(
          {'name': name, 'email': email, 'password': password, 'role': role}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Usermodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("signup Failed");
    }
  }

  Future<Usermodel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$BaseUrl/login"),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Usermodel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login Failed");
    }
  }

}
