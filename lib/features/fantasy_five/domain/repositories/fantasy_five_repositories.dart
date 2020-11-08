import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy_five_entity.dart';

abstract class FantasyFiveRepository {
  Future<Either<Failure, FantasyEntity>> getTeam({@required String uid});
}

abstract class AuthServiceRepository {
  Future<Either<FirebaseFailure, UserCredential>> loginWithEmail(
      {@required String email, @required String password});
  Future<Either<FirebaseFailure, UserCredential>> registerWithEmail(
      {@required String email, @required String password});
  Future<void> logOut();
}

abstract class UserInfoRepository {
  Future<Either<FireStoreFailure, bool>> updateUserInfo({
    @required String fullName,
    @required String teamName,
    @required String phone,
    @required String address,
  });
}
