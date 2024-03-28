import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/failures.dart';

abstract interface class UseCase<SuccesType, Params> {
  Future<Either<Failure, SuccesType>> call(Params params);
}
