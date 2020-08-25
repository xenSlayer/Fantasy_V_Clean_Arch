import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fantasy_five_repositories.dart';

class AuthService implements AuthUseCase<UserCredential, EmailPasswordParams> {
  final AuthServiceRepository authServiceRepository;

  AuthService({@required this.authServiceRepository});

  @override
  Future<Either<FirebaseFailure, UserCredential>> loginWithEmail(
      EmailPasswordParams loginParams) async {
    return await authServiceRepository.loginWithEmail(
        email: loginParams.email, password: loginParams.password);
  }

  @override
  Future<void> logout() async => await authServiceRepository.logOut();

  @override
  Future<Either<FirebaseFailure, UserCredential>> register(
      EmailPasswordParams uid) {
    throw UnimplementedError();
  }
}

class EmailPasswordParams extends Equatable {
  final String email;
  final String password;

  EmailPasswordParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
