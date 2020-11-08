import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../repositories/fantasy_five_repositories.dart';

// UserInfo usecase abstract class
abstract class UserInfoUseCase<Type, Params> {
  Future<Either<FireStoreFailure, bool>> updateUserInfo(Params info);
}

// UserInfo usecase concrete implementation
class UserInfo implements UserInfoUseCase<FireStoreFailure, UserInfoParams> {
  final UserInfoRepository userInfoRepository;
  UserInfo(this.userInfoRepository);
  @override
  Future<Either<FireStoreFailure, bool>> updateUserInfo(
      UserInfoParams params) async {
    return await userInfoRepository.updateUserInfo(
        fullName: params.fullName,
        teamName: params.teamName,
        phone: params.phone,
        address: params.address);
  }
}

// UserInfo params
class UserInfoParams extends Equatable {
  final String fullName;
  final String teamName;
  final String phone;
  final String address;

  UserInfoParams(
      {@required this.fullName,
      @required this.teamName,
      @required this.phone,
      @required this.address});
  @override
  List<Object> get props => [fullName, teamName, phone, address];
}
