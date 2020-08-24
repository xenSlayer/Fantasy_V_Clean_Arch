import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params uid);
}

abstract class AuthUseCase<Type, Params> {
  Future<Either<Failure, Type>> loginWithEmail(Params uid);
  Future<void> logout();
  Future<Either<Failure, Type>> register(Params uid);
}
