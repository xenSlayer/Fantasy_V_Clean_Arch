part of 'team_bloc.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamUnloadedInitialState extends TeamState {}

// class TeamLoadingState extends TeamState {}

class TeamLoadFailedState extends TeamState {
  final String errorMessage;
  TeamLoadFailedState({@required this.errorMessage});
}

class TeamLoadSuccessState extends TeamState {
  final List<PlayerEntity> gk, df, mf, fw;
  final FantasyEntity team;
  TeamLoadSuccessState({
    @required this.gk,
    @required this.df,
    @required this.mf,
    @required this.fw,
    @required this.team,
  });
}
