import 'package:Fantasy_V_Clean_Arch/core/error/failures.dart';
import 'package:Fantasy_V_Clean_Arch/core/network/network_info.dart';
import 'package:Fantasy_V_Clean_Arch/core/test_urls/api_endpoints.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/datasources/remote_data_source.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/repositories/fantasy_five_repositoreis_impl.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/entities/fantasy_five.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/sample_model/sample_model.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockFantasyFiveRemoteDataSource extends Mock
    implements FantasyFiveRemoteDataSource {}

class MockLoginRepo extends Mock implements FirebaseAuth {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockFantasyFiveRemoteDataSource remoteDataSource;
  FantasyFiveRepositoryImpl fantasyFiveRepositoryImpl;
  MockLoginRepo mockLoginRepo;
  AuthServiceRepositoryImpl authServiceRepositoryImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    remoteDataSource = MockFantasyFiveRemoteDataSource();
    mockLoginRepo = MockLoginRepo();
    fantasyFiveRepositoryImpl = FantasyFiveRepositoryImpl(
        networkInfo: mockNetworkInfo, remoteDataSource: remoteDataSource);
    authServiceRepositoryImpl = AuthServiceRepositoryImpl(auth: mockLoginRepo);
  });

  String uid = TESTUID;

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

  AuthResult authResult;

  group('Firebase LOGIN', () {
    test('should return [AuthResult] if login is successful', () async {
      // arrange
      when(mockLoginRepo.signInWithEmailAndPassword(
              email: 'email', password: 'password'))
          .thenAnswer((_) async => authResult);
      //act
      final result = await authServiceRepositoryImpl.loginWithEmail(
          email: 'email', password: 'password');
      // assert
      expect(result, Right(authResult));
    });

    test('should return failure[FirebaseFailure] if the login is unsuccessful',
        () async {
      // arrange
      when(mockLoginRepo.signInWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(PlatformException);
      //act
      final result = await authServiceRepositoryImpl.loginWithEmail(
          email: 'email', password: 'password');
      Function call = authServiceRepositoryImpl.loginWithEmail;
      // assert
      expect(() => call(email: 'email', password: 'password'),
          Left(isInstanceOf<FirebaseFailure>()));
    });
  });

  group('Firebase SIGNUP', () {
    test('should return [AuthResult] when signing up is successful', () async {
      // arrange
      when(mockLoginRepo.signInWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => authResult);
      //act
      final result = await authServiceRepositoryImpl.loginWithEmail(
          email: 'email', password: 'password');
      // assert
      verify(mockLoginRepo.signInWithEmailAndPassword(
          email: 'email', password: 'password'));
      expect(result, Right(authResult));
      verifyNoMoreInteractions(mockLoginRepo);
    });

    test('should return [FirebaseFailure] when signing up is unsuccessful',
        () async {
      // arrange
      when(mockLoginRepo.signInWithEmailAndPassword(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(PlatformException);
      //act
      final Function call = authServiceRepositoryImpl.loginWithEmail;

      // assert
      expect(() => call(email: 'email', password: 'password'),
          throwsA(isInstanceOf<AuthException>()));
    });
  });

  group('Firebase LOGOUT', () {
    test('should log out user when logOut() method is called', () async {
      //act
      await authServiceRepositoryImpl.logOut();
      // assert
      verify(mockLoginRepo.signOut());
      verifyNoMoreInteractions(mockLoginRepo);
    });
  });
}
