import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/entities/fantasy_five.dart';
import '../../../domain/usecases/get_team.dart';

part 'team_event.dart';
part 'team_state.dart';


class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final GetTeam getTeam;
  final String uid;
  TeamBloc({@required this.getTeam, @required this.uid})
      : super(TeamUnloadedState());

  @override
  Stream<TeamState> mapEventToState(
    TeamEvent event,
  ) async* {
    if (event is ReloadTeamEvent) {
      yield* _getTeam(getTeam, uid);
    }
    yield* _getTeam(getTeam, uid);
  }
}


Stream<TeamState> _getTeam(GetTeam getTeam, String uid) async* {
  // Loading state
  yield TeamLoadingState();
  // Try making request to the [API]
  final Either<Failure, FantasyEntity> successOrFailure =
      await getTeam.call(UID(uid));
  yield* successOrFailure.fold((error) async* {
    // API Call failed =>
    yield TeamLoadFailedState(errorMessage: mapErrorToMessage(error));
  }, (team) async* {
    // API call success =>
    yield TeamLoadSuccessState(team: team);
  });
}
