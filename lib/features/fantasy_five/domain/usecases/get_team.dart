import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/fantasy_five.dart';
import '../repositories/fantasy_five_repositories.dart';

class GetTeam implements UseCase<FantasyEntity, UID> {
  final FantasyFiveRepository fantasyFiveRepository;

  GetTeam({@required this.fantasyFiveRepository});

  @override
  Future<Either<Failure, FantasyEntity>> call(UID user) async =>
      await fantasyFiveRepository.getTeam(user.uid);
}

class UID extends Equatable {
  final String uid;
  UID(this.uid);
  @override
  List<Object> get props => [uid];
}
