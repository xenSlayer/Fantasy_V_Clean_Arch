import 'package:Fantasy_V_Clean_Arch/core/models/firebase_auth_model.dart';
import 'package:Fantasy_V_Clean_Arch/core/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
  });

  test('should be a subclass of [UserEntity]', () async {
    // arrange
    when(mockAuthService.signInWithEmail(any, any))
        .thenAnswer((_) async => User());
    //act
    final result = await mockAuthService.signInWithEmail('email', 'password');
    // assert
    verify(mockAuthService.signInWithEmail('email', 'password'));
    expect(result, equals(isInstanceOf<UserEntity>()));
  });
}
