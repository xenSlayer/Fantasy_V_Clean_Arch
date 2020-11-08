import 'dart:convert';

import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/data/models/fantasy_five_models.dart';
import 'package:Fantasy_V_Clean_Arch/features/fantasy_five/domain/entities/fantasy_five_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../core/sample_model/sample_model.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  FantasyFiveModel fantasyFiveModel = fantasyfiveSampleModel();

  test('should be sub class of fantasyFive Entity', () async {
    expect(fantasyFiveModel, isA<FantasyEntity>());
  });

  group('fromJson()', () {
    test('should return a [FantasyFiveModel]', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('team'))[0];
      //act
      final FantasyFiveModel result = FantasyFiveModel.fromJson(jsonMap);
      // assert
      expect(result, equals(fantasyFiveModel));
    });
  });

  group('toJson()', () {
    test('should return a jsonMap containing valid data', () async {
      //act
      final Map<String, dynamic> result = fantasyFiveModel.toJson();
      // assert
      final Map<String, dynamic> expectedMap = json.decode(fixture('team'))[0];
      expect(result, equals(expectedMap));
    });
  });
}
