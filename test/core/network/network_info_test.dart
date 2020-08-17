import 'package:Fantasy_V_Clean_Arch/core/network/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockDataConnectionChecker);
  });
  test('should return true when isConnected getter is called', () async {
    // arrange
    when(mockDataConnectionChecker.hasConnection).thenAnswer((_) async => true);
    //act
    final result = await networkInfoImpl.isConnected;
    // assert
    verify(mockDataConnectionChecker.hasConnection);
    expect(result, true);
  });
}
