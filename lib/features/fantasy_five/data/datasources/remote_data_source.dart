import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../models/fantasy_five_models.dart';
import '../models/user_info_model.dart';

abstract class FantasyFiveRemoteDataSource {
  Future<FantasyFiveModel> getTeam(String uid);
}

class FantasyFiveRemoteDataSourceImpl implements FantasyFiveRemoteDataSource {
  final Client client;

  FantasyFiveRemoteDataSourceImpl({@required this.client});
  @override
  Future<FantasyFiveModel> getTeam(String uid) async {
    final Response response = await client.get(
        'https://fantasyv.pythonanywhere.com/event/?uid=$uid',
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return FantasyFiveModel.fromJson(json.decode(response.body)[0]);
    } else {
      throw (ServerException());
    }
  }
}

abstract class UserInfoFirestoreCalls {
  Future<bool> updateUserInfo({
    @required String fullName,
    @required String teamName,
    @required String phone,
    @required String address,
  });
}

class UserInfoFireStoreCallsImpl implements UserInfoFirestoreCalls {
  @override
  Future<bool> updateUserInfo({
    @required String fullName,
    @required String teamName,
    @required String phone,
    @required String address,
  }) async {
    UserInfoModel userInfo = UserInfoModel(
        fullName: fullName, teamName: teamName, phone: phone, address: address);
    User user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('user_info')
        .doc(user.uid)
        .set(userInfo.toJson());
    return true;
  }
}
