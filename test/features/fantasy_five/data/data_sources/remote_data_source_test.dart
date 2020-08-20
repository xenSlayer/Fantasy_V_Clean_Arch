import 'dart:convert';

import 'package:Fantasy_V_Clean_Arch/core/error/expcetions.dart';
import 'package:Fantasy_V_Clean_Arch/core/test_urls/api_endpoints.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/datasources/remote_data_source.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/models/fantasy_five_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';


class MockHttpClient extends Mock implements http.Client {}

void main() {
  FantasyFiveRemoteDataSourceImpl remoteDataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = FantasyFiveRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('should get user fantasy team from the API', () {
    String uid = TESTUID;

    test('should perfome GET request in the API', () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('team'), 200));
      //act
      await remoteDataSource.getTeam(uid);
      // assert
      verify(mockHttpClient.get("${ENDPOINTS['team']}$uid",
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return [FantasyFiveModel] if the status code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('team'), 200));
      //act
      final FantasyFiveModel result = await remoteDataSource.getTeam(uid);
      // assert
      expect(result,
          equals(FantasyFiveModel.fromJson(json.decode(fixture('team'))[0])));
    });

    test('should throw ServerException if status code is not 200', () async {
      // arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      //act
      final Function call = remoteDataSource.getTeam;
      // assert
      expect(() => call(uid), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
