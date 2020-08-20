import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/models/firebase_auth_model.dart';
import 'core/models/user.dart';
import 'core/widgets/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(FantasyV());
  });
}

class FantasyV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User>(
          stream: AuthService().user,
          builder: (context, snapshot) {
            return snapshot.hasData ? NavBar() : null;
          }),
    );
  }
}
