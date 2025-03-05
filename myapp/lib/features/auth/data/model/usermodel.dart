import 'package:flutter/foundation.dart';

import '../../domain/entities/user.dart';

class Usermodel extends User {
  Usermodel(
      {required String id,
      required  String name,
      required  String email,
      required  String role,
      required   String token})
      : super(id: id, name: name, email: email, role: role, token: token);



   factory Usermodel.fromJson(Map<String,dynamic>json){
      return Usermodel(id: json["id"]?? "", name: json["name"]?? "", email: json["email"]?? "", role: json["role"]?? "", token: json["token"]?? "");
    }
}
