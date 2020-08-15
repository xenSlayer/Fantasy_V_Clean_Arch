import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy_five.dart';

abstract class FantasyFiveRepository {
  Future<Either<Failure, FantasyEntity>> getTeam(String uid);
}
