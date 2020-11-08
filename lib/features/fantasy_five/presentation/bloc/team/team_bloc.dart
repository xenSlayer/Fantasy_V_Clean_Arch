import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/fantasy_five_entity.dart';
import '../../../domain/usecases/get_team.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final GetTeam getTeam;
  final UID uid;
  final Function loadEvent;
  TeamBloc(
      {@required this.getTeam, @required this.uid, @required this.loadEvent})
      : super((TeamUnloadedInitialState()));

  @override
  Stream<TeamState> mapEventToState(
    TeamEvent event,
  ) async* {
    if (event is ReloadTeamEvent) {
      final Either<Failure, FantasyEntity> successOrFailure =
          await getTeam.call(uid);

      yield* successOrFailure.fold((error) async* {
        yield TeamLoadFailedState(
            errorMessage: mapNetworkErrorToMessage(error));
      }, (team) async* {
        yield TeamLoadSuccessState(
          team: team,
          gk: _checkStartingXIPlayerPosition(team: team, position: 'GK'),
          df: _checkStartingXIPlayerPosition(team: team, position: 'DF'),
          mf: _checkStartingXIPlayerPosition(team: team, position: 'MF'),
          fw: _checkStartingXIPlayerPosition(team: team, position: 'FW'),
        );
      });
    }
  }
}

// Map player position
// ignore: missing_return
List<PlayerEntity> _checkStartingXIPlayerPosition(
    {@required FantasyEntity team, @required String position}) {
  List<PlayerEntity> gk = [];
  List<PlayerEntity> df = [];
  List<PlayerEntity> mf = [];
  List<PlayerEntity> fw = [];

  team.startingXIList.forEach((player) {
    switch (player.playerPosition) {
      case 'GK':
        gk.add(player);
        break;
      case 'DF':
        df.add(player);
        break;
      case 'MF':
        mf.add(player);
        break;
      case 'FW':
        fw.add(player);
        break;
    }
  });

  switch (position) {
    case 'GK':
      return gk;
      break;
    case 'DF':
      return df;
      break;
    case 'MF':
      return mf;
      break;
    case 'FW':
      return fw;
      break;
  }
}
