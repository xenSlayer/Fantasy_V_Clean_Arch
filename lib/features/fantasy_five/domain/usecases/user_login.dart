import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../repositories/fantasy_five_repositories.dart';

// AuthService use case abstract class
abstract class AuthServiceUseCase<Type, Params> {
  Future<Either<Failure, Type>> loginWithEmail(Params uid);
  Future<void> logout();
  Future<Either<Failure, Type>> register(Params uid);
}

// AuthService usecase concrete implementation
class AuthService
    implements AuthServiceUseCase<UserCredential, EmailPasswordParams> {
  final AuthServiceRepository authServiceRepository;

  AuthService({@required this.authServiceRepository});

  // Login
  @override
  Future<Either<FirebaseFailure, UserCredential>> loginWithEmail(
      EmailPasswordParams loginParams) async {
    return await authServiceRepository.loginWithEmail(
        email: loginParams.email, password: loginParams.password);
  }

  // Logout
  @override
  Future<void> logout() async => await authServiceRepository.logOut();

  // Register
  @override
  Future<Either<FirebaseFailure, UserCredential>> register(
      EmailPasswordParams loginParams) async {
    return await authServiceRepository.registerWithEmail(
        email: loginParams.email, password: loginParams.password);
  }
}

// Email Password Params
class EmailPasswordParams extends Equatable {
  final String email;
  final String password;

  EmailPasswordParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
