import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:flutter/material.dart';

import '../../features/fantasy_five/presentation/pages/team/team_page.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int currentTab = 0;
  final List<Widget> screens = [TeamPage(), TeamPage()];
  Widget currentScreen = TeamPage();

  // final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0),
      body: IndexedStack(index: currentTab, children: screens),
      bottomNavigationBar: bmnav.BottomNav(
        color: Colors.white,
        index: currentTab,
        elevation: 0.0,
        labelStyle: bmnav.LabelStyle(visible: false),
        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },
        items: [
          bmnav.BottomNavItem(Icons.polymer, label: 'Team'),
          bmnav.BottomNavItem(Icons.polymer, label: 'Team'),
        ],
      ),
    );
  }
}
