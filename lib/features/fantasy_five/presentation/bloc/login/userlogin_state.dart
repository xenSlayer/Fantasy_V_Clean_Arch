part of 'userlogin_bloc.dart';

abstract class UserloginState extends Equatable {
  const UserloginState();

  @override
  List<Object> get props => [];
}

class UserloginInitialState extends UserloginState {}

class UserLoginProgressState extends UserloginState {}

class UserLoginSuccessfulState extends UserloginState {
  final UserCredential authResult;

  UserLoginSuccessfulState({this.authResult});
}

class UserLoginFailureState extends UserloginState {
  final String message;
  UserLoginFailureState({@required this.message});
}
