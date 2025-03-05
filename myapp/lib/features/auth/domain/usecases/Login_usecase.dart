import 'package:myapp/features/auth/domain/entities/user.dart';
import 'package:myapp/features/auth/domain/repositories/authrepositores.dart';

class LoginUsecase {
  final Authrepositores repository;

  LoginUsecase(this.repository);

  
  Future<User> login(String email, String password) {
    return repository.login(email, password);
  }
}
