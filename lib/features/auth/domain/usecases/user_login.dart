import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/core/usecase/usecase.dart';
import 'package:prueba_wagon/features/auth/domain/entities/user.dart';
import 'package:prueba_wagon/features/auth/domain/repositories/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPass(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
