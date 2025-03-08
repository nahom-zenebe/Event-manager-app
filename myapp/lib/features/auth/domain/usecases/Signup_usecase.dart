import 'package:myapp/features/auth/domain/repositories/authrepositores.dart';
import '../entities/user.dart';
class SignupUsecase {
  final Authrepositores repository;

  SignupUsecase(this.repository);

  
  Future<User> signup(String name, String email, String password, String role) {
    return repository.signup(name, email, password, role);
  }
}
