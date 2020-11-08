import '../../features/fantasy_five/domain/entities/fantasy_five_entity.dart';
import 'package:flutter/material.dart';
// import 'package:marquee/marquee.dart';

import '../../features/fantasy_five/presentation/pages/player_detail/player_detail_page.dart';
import 'captain_band.dart';

class TeamKitWithOutPoints extends StatelessWidget {
  TeamKitWithOutPoints(
      {@required this.playerName,
      @optionalTypeArgs this.captainName,
      this.injured,
      this.player});
  final String playerName;
  final bool injured;
  final PlayerEntity player, captainName;

  @override
  Widget build(BuildContext context) {
    var firstname = playerName.split(' ');
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerDetailPage(player: player))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://fantasy.premierleague.com/dist/img/shirts/special/shirt_49-66.webp'),
                  ))),
              captainName.playerId == player.playerId
                  ? Container(
                      padding: EdgeInsets.only(top: 40, left: 40),
                      child: CaptainBand())
                  : SizedBox()
            ],
          ),
          SizedBox(height: 5),
          Container(
              width: 70,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                  color:
                      injured == true ? Color(0xFFc0020d) : Color(0xFF00763b)),
              child: Center(
                child: firstname.last.length > 11
                    ? Container(height: 18, child: Text('')
                        // Marquee(
                        //   text: firstname.last,
                        //   style: TextStyle(color: Colors.white, fontSize: 13),
                        //   scrollAxis: Axis.horizontal,
                        //   blankSpace: 10,
                        //   velocity: 15,
                        //   pauseAfterRound: Duration(seconds: 3),
                        //   decelerationCurve: Curves.easeInOut,
                        //   accelerationCurve: Curves.easeIn,
                        // ),
                        )
                    : Text(firstname.last,
                        style: TextStyle(color: Colors.white, fontSize: 13)),
              )),
          Container(
              width: 70,
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
              decoration: BoxDecoration(
                  color: Color(0xFF00ff87),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: Center(
                child: Text('MCI',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              )),
        ],
      ),
    );
  }
}
