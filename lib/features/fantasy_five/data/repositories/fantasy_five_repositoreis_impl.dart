import 'package:dartz/dartz.dart';
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
