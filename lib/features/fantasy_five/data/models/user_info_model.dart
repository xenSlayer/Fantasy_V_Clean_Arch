import 'package:meta/meta.dart';
import '../../domain/entities/user_info_entity.dart';

class UserInfoModel extends UserInfoEntity {
  UserInfoModel(
      {@required String fullName,
      @required String teamName,
      @required String phone,
      @required address})
      : super(
            fullName: fullName,
            phone: phone,
            address: address,
            teamName: teamName);

  factory UserInfoModel.fromJson(json) {
    return UserInfoModel(
        fullName: json['full_name'],
        phone: json['phone'],
        address: json['address'],
        teamName: json['team_name']);
  }

  Map<String, dynamic> toJson() => {
        'full_name': fullName,
        'phone': phone,
        'address': address,
        'team_name': teamName,
      };

  @override
  List<Object> get props => [fullName, teamName, phone, address];
}
