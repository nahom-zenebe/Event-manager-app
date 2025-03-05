import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_usecase.dart'; // Make sure the import paths are correct
import '../../../domain/usecases/signup_usecase.dart'; // Same for the signup usecase
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;



  AuthBloc({required this.loginUsecase, required this.signupUsecase})
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUsecase.login(event.email, event.password);
        emit(AuthSucess(user));
      } catch (error) {
        emit(AuthFailure(error.toString()));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signupUsecase.signup(event.name, event.email, event.password, event.role);
        emit(AuthSucess(user));
      } catch (error) {
        emit(AuthFailure(error.toString()));
      }
    });
  }
}

