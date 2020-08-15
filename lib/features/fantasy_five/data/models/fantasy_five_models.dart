import 'package:meta/meta.dart';

import '../../domain/entities/fantasy_five.dart';

class FantasyFiveModel extends FantasyEntity {
  FantasyFiveModel(
      {@required String uid,
      @required String playerName,
      @required int gwPoints,
      @required int points,
      @required List<Player> captain,
      @required List<Player> startingXIList,
      @required List<Player> substituteList})
      : super(uid, playerName, gwPoints, points, captain, startingXIList,
            substituteList);

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

  factory FantasyFiveModel.fromJson(Map<String, dynamic> json) =>
      FantasyFiveModel(
        uid: json["uid"],
        playerName: json["player_name"],
        gwPoints: json["GW_points"],
        points: json["points"],
        captain:
            List<Player>.from(json["captain"].map((x) => Player.fromJson(x))),
        startingXIList: List<Player>.from(
            json["startingXI_list"].map((x) => Player.fromJson(x))),
        substituteList: List<Player>.from(
            json["substitute_list"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "player_name": playerName,
        "GW_points": gwPoints,
        "points": points,
        "captain": List<dynamic>.from(captain.map((x) => x.toJson())),
        "startingXI_list":
            List<dynamic>.from(startingXIList.map((x) => x.toJson())),
        "substitute_list":
            List<dynamic>.from(substituteList.map((x) => x.toJson())),
      };
}

class Player {
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

  int id;
  String playerName;
  int playerId;
  bool playerIsInjured;
  bool playerIsSuspended;
  int playerPrice;
  int playerGwPoints;
  int totalPoints;
  String playerClub;
  String playerPosition;
  String playerImage;
  int playerGoalsScored;
  int playerAssist;
  int cleanSheets;
  int yellowCards;
  int redCards;
  String extraAttributes;

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
