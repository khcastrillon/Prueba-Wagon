import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> loginWithEmailPass({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
}
