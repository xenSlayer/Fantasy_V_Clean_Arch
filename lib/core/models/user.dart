import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends UserEntity {
  User({String uid}) : super(uid: uid);
}

class UserEntity extends Equatable {
  final String uid;
  UserEntity({@required this.uid});

  @override
  List<Object> get props => [uid];
}
