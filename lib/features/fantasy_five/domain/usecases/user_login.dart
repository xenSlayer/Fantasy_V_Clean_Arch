import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fantasy_five_repositories.dart';

class UserLogin implements AuthUseCase<AuthResult, LoginRegisterParams> {
  final AuthServiceRepository authServiceRepository;

  UserLogin({@required this.authServiceRepository});

  @override
  Future<Either<FirebaseFailure, AuthResult>> loginWithEmail(
      LoginRegisterParams loginParams) async {
    return await authServiceRepository.loginWithEmail(
        email: loginParams.email, password: loginParams.password);
  }

  @override
  Future<void> logout() async => await authServiceRepository.logOut();

  @override
  Future<Either<FirebaseFailure, AuthResult>> register(
      LoginRegisterParams uid) {
    throw UnimplementedError();
  }
}

class LoginRegisterParams extends Equatable {
  final String email;
  final String password;

  LoginRegisterParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
