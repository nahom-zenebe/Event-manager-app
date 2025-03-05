import '../model/usermodel.dart';
import '../../domain/repositories/authrepositores.dart';
import '../datasource/user_datasource.dart';
import '../../domain/entities/user.dart';
class UserAuthrepositoryimpl implements Authrepositores {
  final UserDatasource userDatasource;

  UserAuthrepositoryimpl(this.userDatasource);

  @override
  Future<Usermodel> signup(
      String name, String email, String password, String role) {
    return userDatasource.signup(name, email, password, role);
  }

   @override
  Future<Usermodel> login( String email, String password) {
    return userDatasource.login( email, password);
  }
}
