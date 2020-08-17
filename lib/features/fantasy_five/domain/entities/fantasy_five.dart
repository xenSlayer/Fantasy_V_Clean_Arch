import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/fantasy_five_models.dart';

class FantasyEntity extends Equatable {
  final int pk;
  final String uid;
  final String playerName;
  final int remainingTransfers;
  final bool unlimitedTransfer;
  final int totalPoints;
  final int gwPoints;
  final List<Player> captain;
  final List<Player> startingXIList;
  final List<Player> substituteList;

  FantasyEntity(
      {@required this.pk,
      @required this.uid,
      @required this.playerName,
      @required this.remainingTransfers,
      @required this.unlimitedTransfer,
      @required this.totalPoints,
      @required this.gwPoints,
      @required this.captain,
      @required this.startingXIList,
      @required this.substituteList});

  @override
  List<Object> get props => [
        pk,
        uid,
        playerName,
        remainingTransfers,
        unlimitedTransfer,
        totalPoints,
        gwPoints,
        captain,
        startingXIList,
        substituteList
      ];
}

class PlayerEntity extends Equatable {
  final int id;
  final String playerName;
  final int playerId;
  final bool playerIsInjured;
  final bool playerIsSuspended;
  final int playerPrice;
  final int playerGWPoints;
  final int totalPoints;
  final String playerClub;
  final String playerPosition;
  final String playerImage;
  final int playerGoalsScored;
  final int playerAssist;
  final int cleanSheets;
  final int yellowCards;
  final int redCards;
  final extraAttributes;

  PlayerEntity(
      {this.id,
      this.playerName,
      this.playerId,
      this.playerIsInjured,
      this.playerIsSuspended,
      this.playerPrice,
      this.playerGWPoints,
      this.totalPoints,
      this.playerClub,
      this.playerPosition,
      this.playerImage,
      this.playerGoalsScored,
      this.playerAssist,
      this.cleanSheets,
      this.yellowCards,
      this.redCards,
      this.extraAttributes});

  @override
  List<Object> get props => [
        id,
        playerName,
        playerId,
        playerIsInjured,
        playerIsSuspended,
        playerPrice,
        playerGWPoints,
        totalPoints,
        playerClub,
        playerPosition,
        playerImage,
        playerGoalsScored,
        playerAssist,
        cleanSheets,
        yellowCards,
        redCards,
        extraAttributes
      ];
}
