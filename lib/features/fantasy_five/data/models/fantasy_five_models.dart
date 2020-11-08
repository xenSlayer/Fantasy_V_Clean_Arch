import 'package:meta/meta.dart';

import '../../domain/entities/fantasy_five_entity.dart';

class FantasyFiveModel extends FantasyEntity {
  FantasyFiveModel(
      {@required int pk,
      @required String uid,
      @required String playerName,
      @required int remainingTransfers,
      @required bool unlimitedTransfer,
      @required int totalPoints,
      @required int gwPoints,
      @required List<PlayerEntity> captain,
      @required List<PlayerEntity> startingXIList,
      @required List<PlayerEntity> substituteList
      })
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
    int id,
    String playerName,
    int playerId,
    bool playerIsInjured,
    bool playerIsSuspended,
    int playerPrice,
    int playerGwPoints,
    int totalPoints,
    String playerClub,
    String playerPosition,
    String playerImage,
    int playerGoalsScored,
    int playerAssist,
    int cleanSheets,
    int yellowCards,
    int redCards,
    final extraAttributes,
  }) : super(
            id: id,
            playerName: playerName,
            playerId: playerId,
            playerIsInjured: playerIsInjured,
            playerIsSuspended: playerIsSuspended,
            playerPrice: playerPrice,
            playerGWPoints: playerGwPoints,
            totalPoints: totalPoints,
            playerClub: playerClub,
            playerPosition: playerPosition,
            playerImage: playerImage,
            playerGoalsScored: playerGoalsScored,
            playerAssist: playerAssist,
            cleanSheets: cleanSheets,
            yellowCards: yellowCards,
            redCards: redCards,
            extraAttributes: extraAttributes);

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
        "player_GWPoints": playerGWPoints,
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
