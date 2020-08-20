import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../domain/usecases/user_login.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  UserLogin userLogin;
  UserloginBloc({@required this.userLogin}) : super(UserloginInitialState());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    if (event is LoginEvent) {
      Either<Failure, AuthResult> loginStatus = await userLogin
          .call(LoginParams(email: event.email, password: event.password));
      loginStatus.fold((failure) async* {
        yield UserLoginFailureState(message: 'INVALID CREDENTIALS');
      }, (authresult) async* {
        yield UserLoginSuccessfulState(authResult: authresult);
      });
    }
  }
}
