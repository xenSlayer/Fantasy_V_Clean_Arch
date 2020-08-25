import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/models/firebase_auth_model.dart';
import 'core/models/user.dart';
import 'core/widgets/navbar.dart';
import 'features/fantasy_five/presentation/pages/user_login/user_login_page.dart';
import 'injection_containers/team_injection_containers/team_injection_container.dart';
import 'injection_containers/user_login_injection_containers/user_login_injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    init();
    login();
    runApp(FantasyV());
  });
}

class FantasyV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<UserEntity>(
            stream: AuthService().user,
            builder: (context, snapshot) {
              return snapshot.hasData ? NavBar() : LoginPage();
            }));
  }
}
