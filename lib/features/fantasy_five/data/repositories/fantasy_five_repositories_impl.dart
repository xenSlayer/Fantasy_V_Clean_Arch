import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/fantasy_five_entity.dart';
import '../../domain/repositories/fantasy_five_repositories.dart';
import '../datasources/remote_data_source.dart';

/// FantasyFive Concrete Implementation
class FantasyFiveRepositoryImpl implements FantasyFiveRepository {
  final NetworkInfo networkInfo;
  final FantasyFiveRemoteDataSource remoteDataSource;

  FantasyFiveRepositoryImpl(
      {@required this.networkInfo, @required this.remoteDataSource});
  @override
  Future<Either<Failure, FantasyEntity>> getTeam({@required String uid}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDataTeam = await remoteDataSource.getTeam(uid);
        return Right(remoteDataTeam);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}

/// AuthService Concrete Implementation
class AuthServiceRepositoryImpl implements AuthServiceRepository {
  final FirebaseAuth auth;

  AuthServiceRepositoryImpl({@required this.auth});

  // Login
  @override
  Future<Either<FirebaseFailure, UserCredential>> loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseFailure(error));
    }
  }

  // Logout
  @override
  Future<void> logOut() async {
    await auth.signOut();
  }

  // Register
  @override
  Future<Either<FirebaseFailure, UserCredential>> registerWithEmail(
      {@required String email, @required String password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } on FirebaseAuthException catch (error) {
      return Left(FirebaseFailure(error));
    }
  }
}

// UserInfo
class UserInfoRepositoryImpl implements UserInfoRepository {
  final NetworkInfo networkInfo;
  final UserInfoFirestoreCalls remoteCalls;

  UserInfoRepositoryImpl(
      {@required this.networkInfo, @required this.remoteCalls});

  @override
  Future<Either<FireStoreFailure, bool>> updateUserInfo(
      {@required String fullName,
      @required String teamName,
      @required String phone,
      @required String address}) async {
    if (await networkInfo.isConnected) {
      final bool result = await remoteCalls.updateUserInfo(
          fullName: fullName,
          teamName: teamName,
          phone: phone,
          address: address);
      return Right(result);
    } else {
      return Left(FireStoreFailure(message: 'NO CONNECTION. TRY AGAIN'));
    }
  }
}
