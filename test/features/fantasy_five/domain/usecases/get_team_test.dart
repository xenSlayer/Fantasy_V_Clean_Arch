import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/entities/fantasy_five.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/repositories/fantasy_five_repositories.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/usecases/get_team.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFantasyFiveRepository extends Mock implements FantasyFiveRepository {}

void main() {
  MockFantasyFiveRepository mockFantasyFiveRepository;
  GetTeam getTeam;

  setUp(() {
    mockFantasyFiveRepository = MockFantasyFiveRepository();
    getTeam = GetTeam(fantasyFiveRepository: mockFantasyFiveRepository);
  });

  final uid = 'Test';
  final teamModel = FantasyEntity(uid, 'Test', 0, 0, [], [], []);

  test('should return a team model from the repository', () async {
    // arrange
    when(mockFantasyFiveRepository.getTeam(uid))
        .thenAnswer((_) async => Right(teamModel));
    //act
    final result = await getTeam(UID(uid));
    // assert
    expect(result, Right(teamModel));
    verify(mockFantasyFiveRepository.getTeam(uid));
    verifyNoMoreInteractions(mockFantasyFiveRepository);
  });
}
