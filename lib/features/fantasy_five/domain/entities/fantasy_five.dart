import 'package:equatable/equatable.dart';

import '../../data/models/fantasy_five_models.dart';

class FantasyEntity extends Equatable {
  final String uid;
  final String playerName;
  final int gwPoints;
  final int points;
  final List<Player> captain;
  final List<Player> startingXIList;
  final List<Player> substituteList;

  FantasyEntity(this.uid, this.playerName, this.gwPoints, this.points,
      this.captain, this.startingXIList, this.substituteList);

  @override
  List<Object> get props => [
        uid,
        playerName,
        gwPoints,
        points,
        captain,
        startingXIList,
        substituteList
      ];
}
