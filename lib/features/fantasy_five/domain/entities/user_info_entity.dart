import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserInfoEntity extends Equatable {
  final String fullName;
  final String phone;
  final String address;
  final String teamName;

  UserInfoEntity(
      {@required this.fullName,
      @required this.phone,
      @required this.address,
      @required this.teamName});
  @override
  List<Object> get props => [fullName, phone, address, teamName];
}
