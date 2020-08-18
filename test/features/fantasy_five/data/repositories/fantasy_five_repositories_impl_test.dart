import 'package:Fantasy_V_Clean_Arch/core/network/network_info.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/datasources/remote_data_source.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/repositories/fantasy_five_repositoreis_impl.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/entities/fantasy_five.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/sample_model/sample_model.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFantasyFiveRemoteDataSource extends Mock
    implements FantasyFiveRemoteDataSource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockFantasyFiveRemoteDataSource remoteDataSource;
  FantasyFiveRepositoryImpl fantasyFiveRepositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    remoteDataSource = MockFantasyFiveRemoteDataSource();
    fantasyFiveRepositoryImpl = FantasyFiveRepositoryImpl(
        networkInfo: mockNetworkInfo, remoteDataSource: remoteDataSource);
  });

  String uid = 'qjufmG6IS3NIBgfCgz8Zb9GKL8G3';

  group('get USER TEAM from API', () {
    test('should check for network status', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      fantasyFiveRepositoryImpl.getTeam(uid);
      // assert
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });
  });

  group('Device is online', () {
    final FantasyEntity obtainedData = fantasyfiveSampleModel();

    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => true);
    });

    test(
        'should return remote data if the call to remote source[API] is successful',
        () async {
      // arrange
      when(remoteDataSource.getTeam(uid))
          .thenAnswer((realInvocation) async => fantasyfiveSampleModel());
      //act
      final result = await fantasyFiveRepositoryImpl.getTeam(uid);
      // assert
      verify(remoteDataSource.getTeam(uid));
      expect(result, equals(Right(obtainedData)));
      verifyNoMoreInteractions(remoteDataSource);
    });
  });

  group('Device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((realInvocation) async => false);
    });
  });
}
