part of 'userlogin_bloc.dart';

abstract class UserloginEvent extends Equatable {
  const UserloginEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends UserloginEvent {
  final String email;
  final String password;

  LoginEvent({@required this.email, @required this.password})
      : assert(email != null, password != null);

  @override
  List<Object> get props => [email, password];
}
