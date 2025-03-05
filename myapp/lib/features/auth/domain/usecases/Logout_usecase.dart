import 'package:myapp/features/auth/domain/repositories/authrepositores.dart';
import 'package:myapp/features/auth/domain/entities/user.dart';
class LogoutUsecase {
  Authrepositores repository;
  LogoutUsecase(this.repository);

 /* Future<User> logout() {
    return repository.logout();
  }*/
}
