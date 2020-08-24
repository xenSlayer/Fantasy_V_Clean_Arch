import 'package:Fantasy_V_Clean_Arch/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/fantasy_five.dart';
import '../../domain/repositories/fantasy_five_repositories.dart';
import '../datasources/remote_data_source.dart';

class FantasyFiveRepositoryImpl implements FantasyFiveRepository {
  final NetworkInfo networkInfo;
  final FantasyFiveRemoteDataSource remoteDataSource;

  FantasyFiveRepositoryImpl(
      {@required this.networkInfo, @required this.remoteDataSource});
  @override
  Future<Either<Failure, FantasyEntity>> getTeam(String uid) async {
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

  @override
  Future<Either<FirebaseFailure, AuthResult>> loginWithEmail(
      {@required String email, @required String password}) async {
    try {
      AuthResult authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(authResult);
    } on PlatformException catch (error) {
      return Left(FirebaseFailure(error));
    }
  }

  @override
  Future<Either<FirebaseFailure, AuthResult>> registerWithEmail(
      {@required String email, @required String password}) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } on PlatformException catch (error) {
      return Left(FirebaseFailure(error));
    }
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }
}
