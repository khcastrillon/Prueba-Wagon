import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/features/auth/domain/entities/user.dart';
import 'package:prueba_wagon/features/auth/domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  AuthBloc({
    required UserLogin userLogin,
  })  : _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthLogin>(_onAuthLogin);
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (uid) => emit(AuthSucces(uid)),
    );
  }
}
