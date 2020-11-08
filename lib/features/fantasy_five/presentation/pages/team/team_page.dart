import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/widgets/kits.dart';
import '../../../../../injection_containers/team_injection_containers/team_injection_container.dart';
import '../../../domain/entities/fantasy_five_entity.dart';
import '../../bloc/team/team_bloc.dart';
import '../../widgets/team_page_widgets/team_page_widgets.dart';

class TeamPage extends StatelessWidget {
  // Refresh controller
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // Refresh function
  void _onRefresh() async {
    sl<TeamBloc>().add(ReloadTeamEvent());
    await Future.delayed(Duration(seconds: 5));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Scaffold(
          backgroundColor: Colors.green,
          // bottomSheet: Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 80,
          //   child: Center(child: Text('POINTS')),
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       // Color(0xFF3d3d69),
          //       borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(20),
          //           topLeft: Radius.circular(20))),
          // ),
          body: BlocProvider(
            create: (_) => sl<TeamBloc>(),
            child: BlocBuilder<TeamBloc, TeamState>(builder: (context, state) {
              sl<TeamBloc>().add(ReloadTeamEvent());
              if (state is TeamLoadSuccessState) {
                return teamLoadSuccessPage(state);
              } else if (state is TeamLoadFailedState) {
                return Center(child: Text('Failed'));
              }
              return Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(),
                  Pitch(),
                ],
              );
            }),
          )),
    );
  }

  // Team Page
  SafeArea teamLoadSuccessPage(TeamLoadSuccessState state) {
    return SafeArea(
      child: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView(
          children: [
            Stack(
              children: [
                // Pitch
                Pitch(),
                Column(
                  children: [
                    // GoalKeepers
                    TeamKit(position: state.gk, captain: state.team.captain),
                    SizedBox(height: 20),
                    // Defenders
                    TeamKit(position: state.df, captain: state.team.captain),
                    SizedBox(height: 20),
                    // Midfielders
                    TeamKit(position: state.mf, captain: state.team.captain),
                    SizedBox(height: 20),
                    // Forwards
                    TeamKit(position: state.fw, captain: state.team.captain),
                    // Bench
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(15)),
                        child: TeamKit(
                            position: state.team.substituteList,
                            captain: state.team.captain)),
                    SizedBox(height: 120)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Team Page Kit -- Without points
class TeamKit extends StatelessWidget {
  TeamKit({this.position, this.captain});
  final List<PlayerEntity> position, captain;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: position
            .map((player) => TeamKitWithOutPoints(
                playerName: player.playerName,
                player: player,
                captainName: captain[0]))
            .toList());
  }
}
