import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/fantasy_five_entity.dart';
import '../repositories/fantasy_five_repositories.dart';

// Get team absctact usecase
abstract class GetTeamUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params uid);
}

// Get team usecase concrete implementation
class GetTeam implements GetTeamUseCase<FantasyEntity, UID> {
  final FantasyFiveRepository fantasyFiveRepository;

  GetTeam({@required this.fantasyFiveRepository});

  @override
  Future<Either<Failure, FantasyEntity>> call(UID user) async =>
      await fantasyFiveRepository.getTeam(uid: user.uid);
}

// Params
class UID extends Equatable {
  final String uid;
  UID(this.uid);
  @override
  List<Object> get props => [uid];
}
