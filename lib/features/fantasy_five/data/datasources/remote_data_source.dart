import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/expcetions.dart';
import '../models/fantasy_five_models.dart';

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
