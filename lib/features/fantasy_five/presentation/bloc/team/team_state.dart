part of 'team_bloc.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamUnloadedState extends TeamState {}

class TeamLoadingState extends TeamState {}

class TeamLoadFailedState extends TeamState {
  final String errorMessage;
  TeamLoadFailedState({@required this.errorMessage});
}

class TeamLoadSuccessState extends TeamState {
  final FantasyEntity team;
  TeamLoadSuccessState({@required this.team});
}
