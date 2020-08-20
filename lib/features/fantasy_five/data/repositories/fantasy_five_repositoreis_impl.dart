import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/expcetions.dart';
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

class AuthServiceRepositoryImpl implements AuthServiceRepository {
  final FirebaseAuth auth;

  AuthServiceRepositoryImpl({@required this.auth});

  @override
  Future<Either<Failure, AuthResult>> loginWithEmail(
      String email, String password) async {
    try {
      AuthResult authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(authResult);
    } on FirebaseException {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResult>> registerWithEmail(
      String email, String password) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(result);
    } on FirebaseException {
      return Left(FirebaseFailure());
    }
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }
}
