import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/models/user_model.dart';
import 'core/widgets/navbar.dart';
import 'features/fantasy_five/presentation/pages/user_login/user_login_page.dart';
import 'injection_containers/team_injection_containers/team_injection_container.dart';
import 'injection_containers/user_login_injection_containers/user_login_injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        theme: ThemeData(
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(backgroundColor: Colors.amber)),
        home: StreamBuilder<UserEntity>(
            stream: FirebaseAuth.instance.authStateChanges().map(
                (User user) => user != null ? UserModel(uid: user.uid) : null),
            builder: (context, snapshot) {
              return snapshot.hasData ? NavBar() : LoginPage();
            }));
  }
}
