import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/user_login.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

class UserAuthBloc extends Bloc<UserloginEvent, UserloginState> {
  AuthService authService;
  UserAuthBloc({@required this.authService}) : super(UserloginInitialState());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    if (event is LoginEvent) {
      // shows loading progress
      yield UserLoginProgressState();
      // make repo call
      Either<FirebaseFailure, UserCredential> authStatus =
          await authService.loginWithEmail(EmailPasswordParams(
              email: event.email, password: event.password));

      yield* authStatus.fold((failure) async* {
        // returns [FirebaseFailure] with messages if signing failed
        yield UserLoginFailureState(
            message: mapFirebaseAuthFailureToMessage(failure.error));
      }, (authresult) async* {
        // returns [AuthResult] if successful
        yield UserLoginSuccessfulState(authResult: authresult);
      });
    } else if (event is LogOutEvent) {
      authService.logout();
    }
  }
}
