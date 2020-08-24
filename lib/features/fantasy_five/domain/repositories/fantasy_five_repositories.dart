import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy_five.dart';

abstract class FantasyFiveRepository {
  Future<Either<Failure, FantasyEntity>> getTeam(String uid);
}

abstract class AuthServiceRepository {
  Future<Either<FirebaseFailure, AuthResult>> loginWithEmail(
      {@required String email, @required String password});
  Future<Either<FirebaseFailure, AuthResult>> registerWithEmail(
      {@required String email, @required String password});
  Future<void> logOut();
}
