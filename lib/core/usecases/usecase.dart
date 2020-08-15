import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, UID> {
  Future<Either<Failure, Type>> call(UID uid);
}
