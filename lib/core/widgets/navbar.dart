import 'dart:async';

import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:flutter/material.dart';

import '../../features/fantasy_five/presentation/pages/team/team_page.dart';

class NavBar extends StatelessWidget {
  final List<Widget> screens = [TeamPage(), TeamPage()];
  final Widget currentScreen = TeamPage();
  final TabControllerStream _tabControllerStream = TabControllerStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _tabControllerStream.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Color(0xFFf0f0f0),
              body: IndexedStack(index: snapshot.data, children: screens),
              bottomNavigationBar: bmnav.BottomNav(
                color: Colors.white,
                index: snapshot.data,
                elevation: 0.0,
                labelStyle: bmnav.LabelStyle(visible: false),
                onTap: (_) => _tabControllerStream.sink.add(_),
                items: [
                  bmnav.BottomNavItem(Icons.polymer, label: 'Team'),
                  bmnav.BottomNavItem(Icons.polymer, label: 'Team'),
                ],
              ));
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
