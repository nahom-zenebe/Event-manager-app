abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final String role;

  SignupEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.role});
}
