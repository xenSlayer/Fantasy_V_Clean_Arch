import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
  @override
  List<Object> get props => [];
}

/// General failures
class ServerFailure extends Failure {}

/// Cache failures from the device itself
class CacheFailure extends Failure {}

/// Firebase login failures with error message passed in constructor
class FirebaseFailure extends Failure {
  final FirebaseAuthException error;
  FirebaseFailure(this.error);

  @override
  List<Object> get props => [error];
}
