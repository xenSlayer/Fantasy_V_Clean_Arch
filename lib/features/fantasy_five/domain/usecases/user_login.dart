import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/fantasy_five_repositories.dart';

class UserLogin implements UseCase<AuthResult, LoginParams> {
  final AuthServiceRepository authServiceRepository;

  UserLogin({@required this.authServiceRepository});

  @override
  Future<Either<Failure, AuthResult>> call(LoginParams loginParams) async =>
      await authServiceRepository.loginWithEmail(
          loginParams.email, loginParams.password);
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
