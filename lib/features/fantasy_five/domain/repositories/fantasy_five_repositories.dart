import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy_five.dart';

abstract class FantasyFiveRepository {
  Future<Either<Failure, FantasyEntity>> getTeam(String uid);
}

abstract class AuthServiceRepository {
  Future<Either<Failure, AuthResult>> loginWithEmail(
      String email, String password);
  Future<Either<Failure, AuthResult>> registerWithEmail(
      String email, String password);
  Future<void> logOut();
}
