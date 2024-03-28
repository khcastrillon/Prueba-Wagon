import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/core/usecase/usecase.dart';
import 'package:prueba_wagon/core/common/entities/user.dart';
import 'package:prueba_wagon/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
