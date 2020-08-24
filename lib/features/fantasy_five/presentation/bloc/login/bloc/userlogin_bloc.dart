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

const ERROR_OPERATION_NOT_ALLOWED = 'ERROR_OPERATION_NOT_ALLOWED';
const ERROR_WEAK_PASSWORD = 'ERROR_WEAK_PASSWORD';
const ERROR_INVALID_EMAIL = 'INVALID EMAIL';
const ERROR_INVALID_CREDENTIAL = 'ERROR_INVALID_CREDENTIAL';
const ERROR_EMAIL_ALREADY_IN_USE = 'ERROR_EMAIL_ALREADY_IN_USE';
const UNKNOWN_ERROR = 'TRY AGAIN';

class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  UserLogin userLogin;
  UserloginBloc({@required this.userLogin}) : super(UserloginInitialState());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    if (event is LoginEvent) {
      // shows loading progress
      yield UserLoginProgressState();
      // make repo call
      Either<FirebaseFailure, AuthResult> loginStatus =
          await userLogin.loginWithEmail(LoginRegisterParams(
              email: event.email, password: event.password));

      yield* loginStatus.fold((failure) async* {
        // returns [FirebaseFailure] with messages if signing failed
        yield UserLoginFailureState(
            message: _mapFailureToMessage(failure.error));
      }, (authresult) async* {
        // returns [AuthResult] if successful
        yield UserLoginSuccessfulState(authResult: authresult);
      });
    }
  }
}

String _mapFailureToMessage(error) {
  switch (error.code) {
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return ERROR_OPERATION_NOT_ALLOWED;
      break;
    case 'ERROR_INVALID_EMAIL':
      return ERROR_INVALID_EMAIL;
      break;
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return ERROR_EMAIL_ALREADY_IN_USE;
      break;
    case 'ERROR_INVALID_CREDENTIAL':
      return ERROR_INVALID_CREDENTIAL;
      break;
    default:
      return UNKNOWN_ERROR;
  }
}
