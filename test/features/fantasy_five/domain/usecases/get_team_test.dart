import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/repositories/fantasy_five_repositories.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/usecases/get_team.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/sample_model/sample_model.dart';

class MockFantasyFiveRepository extends Mock implements FantasyFiveRepository {}

void main() {
  MockFantasyFiveRepository mockFantasyFiveRepository;
  GetTeam getTeam;

  setUp(() {
    mockFantasyFiveRepository = MockFantasyFiveRepository();
    getTeam = GetTeam(fantasyFiveRepository: mockFantasyFiveRepository);
  });

  final uid = 'Test';
  final teamModel = fantasyfiveSampleModel();

  test('should return a team model from the repository', () async {
    // arrange
    when(mockFantasyFiveRepository.getTeam(any))
        .thenAnswer((_) async => Right(teamModel));
    //act
    final result = await getTeam(UID(uid));
    // assert
    expect(result, Right(teamModel));
    verify(mockFantasyFiveRepository.getTeam(any));
    verifyNoMoreInteractions(mockFantasyFiveRepository);
  });
}
