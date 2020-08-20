import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

// Cache failures from the device itself
class CacheFailure extends Failure {}

// Firebase login failures
class FirebaseFailure extends Failure {}
