import 'package:meta/meta.dart';

import '../../domain/entities/fantasy_five.dart';

class FantasyFiveModel extends FantasyEntity {
  FantasyFiveModel(
      {@required int pk,
      @required String uid,
      @required String playerName,
      @required int remainingTransfers,
      @required bool unlimitedTransfer,
      @required int totalPoints,
      @required int gwPoints,
      @required List<Player> captain,
      @required List<Player> startingXIList,
      @required List<Player> substituteList})
      : super(
          pk: pk,
          uid: uid,
          playerName: playerName,
          remainingTransfers: remainingTransfers,
          unlimitedTransfer: unlimitedTransfer,
          totalPoints: totalPoints,
          gwPoints: gwPoints,
          captain: captain,
          startingXIList: startingXIList,
          substituteList: substituteList,
        );

  factory FantasyFiveModel.fromJson(Map<String, dynamic> json) =>
      FantasyFiveModel(
        pk: json["pk"],
        uid: json["uid"],
        playerName: json["player_name"],
        remainingTransfers: json["remaining_transfers"],
        unlimitedTransfer: json["unlimited_transfer"],
        totalPoints: json["total_points"],
        gwPoints: json["GW_points"],
        captain:
            List<Player>.from(json["captain"].map((x) => Player.fromJson(x))),
        startingXIList: List<Player>.from(
            json["startingXI_list"].map((x) => Player.fromJson(x))),
        substituteList: List<Player>.from(
            json["substitute_list"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "uid": uid,
        "player_name": playerName,
        "remaining_transfers": remainingTransfers,
        "unlimited_transfer": unlimitedTransfer,
        "total_points": totalPoints,
        "GW_points": gwPoints,
        "captain": List<dynamic>.from(captain.map((x) => x.toJson())),
        "startingXI_list":
            List<dynamic>.from(startingXIList.map((x) => x.toJson())),
        "substitute_list":
            List<dynamic>.from(substituteList.map((x) => x.toJson())),
      };
}

class Player extends PlayerEntity {
  Player({
    this.id,
    this.playerName,
    this.playerId,
    this.playerIsInjured,
    this.playerIsSuspended,
    this.playerPrice,
    this.playerGwPoints,
    this.totalPoints,
    this.playerClub,
    this.playerPosition,
    this.playerImage,
    this.playerGoalsScored,
    this.playerAssist,
    this.cleanSheets,
    this.yellowCards,
    this.redCards,
    this.extraAttributes,
  });

  final int id;
  final String playerName;
  final int playerId;
  final bool playerIsInjured;
  final bool playerIsSuspended;
  final int playerPrice;
  final int playerGwPoints;
  final int totalPoints;
  final String playerClub;
  final String playerPosition;
  final String playerImage;
  final int playerGoalsScored;
  final int playerAssist;
  final int cleanSheets;
  final int yellowCards;
  final int redCards;
  final String extraAttributes;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        playerName: json["player_name"],
        playerId: json["player_id"],
        playerIsInjured: json["player_isInjured"],
        playerIsSuspended: json["player_isSuspended"],
        playerPrice: json["player_price"],
        playerGwPoints: json["player_GWPoints"],
        totalPoints: json["total_points"],
        playerClub: json["player_club"],
        playerPosition: json["player_position"],
        playerImage: json["player_image"],
        playerGoalsScored: json["player_goals_scored"],
        playerAssist: json["player_assist"],
        cleanSheets: json["clean_sheets"],
        yellowCards: json["yellow_cards"],
        redCards: json["red_cards"],
        extraAttributes: json["extra_attributes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
        "player_id": playerId,
        "player_isInjured": playerIsInjured,
        "player_isSuspended": playerIsSuspended,
        "player_price": playerPrice,
        "player_GWPoints": playerGwPoints,
        "total_points": totalPoints,
        "player_club": playerClub,
        "player_position": playerPosition,
        "player_image": playerImage,
        "player_goals_scored": playerGoalsScored,
        "player_assist": playerAssist,
        "clean_sheets": cleanSheets,
        "yellow_cards": yellowCards,
        "red_cards": redCards,
        "extra_attributes": extraAttributes,
      };
}
