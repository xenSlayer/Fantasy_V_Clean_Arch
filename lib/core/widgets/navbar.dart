import 'dart:async';

import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:flutter/material.dart';

import '../../features/fantasy_five/presentation/pages/search/search_page.dart';
import '../../features/fantasy_five/presentation/pages/team/team_page.dart';

class NavBar extends StatelessWidget {
  final List<Widget> screens = [
    TeamPage(),
    SearchPage(),
    TeamPage(),
    TeamPage(),
    TeamPage()
  ];
  final Widget currentScreen = TeamPage();
  final TabControllerStream _tabControllerStream = TabControllerStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _tabControllerStream.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Scaffold(
                body: IndexedStack(index: snapshot.data, children: screens),
                bottomNavigationBar: bmnav.BottomNav(
                  color: Colors.white,
                  index: snapshot.data,
                  elevation: 0.0,
                  labelStyle: bmnav.LabelStyle(visible: false),
                  onTap: (_) => _tabControllerStream.sink.add(_),
                  items: [
                    bmnav.BottomNavItem(Icons.home, label: 'Team'),
                    bmnav.BottomNavItem(Icons.search, label: 'Team'),
                    bmnav.BottomNavItem(Icons.plus_one, label: 'Team'),
                    bmnav.BottomNavItem(Icons.polymer, label: 'Team'),
                    bmnav.BottomNavItem(Icons.bookmark_border, label: 'Team'),
                  ],
                )),
          );
        });
  }
}

class TabControllerStream {
  StreamController<int> _streamController = StreamController<int>.broadcast();
  Stream<int> get stream => _streamController.stream;
  Sink<int> get sink => _streamController.sink;

  // Close sink
  void dispose() {
    _streamController?.close();
  }
}
