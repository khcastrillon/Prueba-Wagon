import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/core/usecase/usecase.dart';
import 'package:prueba_wagon/features/auth/domain/entities/user.dart';
import 'package:prueba_wagon/features/auth/domain/usecases/current_user.dart';
import 'package:prueba_wagon/features/auth/domain/usecases/user_login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  AuthBloc({
    required UserLogin userLogin,
    required CurrentUser currentUser,
  })  : _userLogin = userLogin,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthLogin>(_onAuthLogin);
    on<AuthCheck>(_onAuthCheck);
  }

  void _onAuthLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSucces(user)),
    );
  }

  void _onAuthCheck(
    AuthCheck event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) {
        print(user.name);
        emit(AuthSucces(user));
      },
    );
  }
}
