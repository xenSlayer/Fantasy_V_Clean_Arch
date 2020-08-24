import 'package:flutter/material.dart';

import '../../../../../injection_containers/user_login_injection_containers/user_login_injection_container.dart';
import '../../../domain/usecases/user_login.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserLogin userLogin = ul<UserLogin>();
    return Scaffold(
        body: SafeArea(
      child: IconButton(
        icon: Icon(Icons.airline_seat_legroom_reduced),
        onPressed: () => userLogin.logout(),
      ),
    ));
  }
}
