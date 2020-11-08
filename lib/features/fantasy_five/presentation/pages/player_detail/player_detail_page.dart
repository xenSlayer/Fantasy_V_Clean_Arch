import 'package:flutter/material.dart';

import '../../../../../core/widgets/club_logos.dart';
import '../../../domain/entities/fantasy_five_entity.dart';

class PlayerDetailPage extends StatelessWidget {
  PlayerDetailPage({this.player});
  final PlayerEntity player;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextStyle style = TextStyle(fontSize: 15, color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: height / 2 - 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(player.playerImage)),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(140))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.circular(100)),
                ),
                IconButton(
                    icon: Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, left: 40),
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                backgroundImage:
                    AssetImage('assets/logo/${clubLogo[player.playerClub]}')),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width / 1.2, height / 2.29, 0, 0),
            padding: EdgeInsets.all(5),
            width: 50,
            height: 50,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star, size: 16, color: Colors.pink),
                  SizedBox(width: 3),
                  Text(player.playerPosition)
                ]),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(500)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 2),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.info, color: Colors.pink),
                        SizedBox(width: 5),
                        Text(
                          'Player info',
                          style: TextStyle(color: Colors.pink, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
          ),
        ]),
      ),
      bottomSheet: Container(
        width: width,
        height: height / 2 - 35,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(120),
              // topLeft: Radius.circular(20)
            ),
            color: Color(0xFFa99168)),
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Text('Scroll for more info', style: TextStyle(color: Colors.black)),
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text('Player Name: ' + player.playerName, style: style),
                  SizedBox(height: 10),
                  Text('Club: ' + player.playerClub, style: style),
                  SizedBox(height: 10),
                  Text('Price: \$ ' + player.playerPrice.toString(),
                      style: style),
                  SizedBox(height: 10),
                  Text('Gameweek Points: ' + player.playerGWPoints.toString(),
                      style: style),
                  SizedBox(height: 10),
                  Text('Goals Scored: ' + player.playerGoalsScored.toString(),
                      style: style),
                  SizedBox(height: 10),
                  Text('Assist: ' + player.playerAssist.toString(),
                      style: style),
                  SizedBox(height: 10),
                  Text('Clean Sheets: ' + player.cleanSheets.toString(),
                      style: style),
                  SizedBox(height: 10),
                  player.playerIsInjured == false
                      ? Text('Injured: No', style: style)
                      : Text('Injured: Yes', style: style),
                  SizedBox(height: 10),
                  player.playerIsSuspended == false
                      ? Text('Suspended: No', style: style)
                      : Text('Susepnded: Yes', style: style),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(width: 10, height: 15, color: Colors.red[600]),
                      SizedBox(width: 10),
                      Text('Red Cards: ' + player.redCards.toString(),
                          style: style),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(width: 10, height: 15, color: Colors.yellow),
                      SizedBox(width: 10),
                      Text('Yellow Cards: ' + player.yellowCards.toString(),
                          style: style),
                    ],
                  ),
                  SizedBox(height: height / 20),
                ]),
          ),
        ]),
      ),
    );
  }
}
