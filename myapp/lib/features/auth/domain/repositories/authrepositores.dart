import '../entities/user.dart';

abstract class Authrepositores {
  Future<User> signup(String name, String email, String password, String role);
  Future<User> login(String email, String password);
  //Future<User> logout();
}
