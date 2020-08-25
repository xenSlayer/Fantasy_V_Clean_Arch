import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/navbar.dart';
import '../../../../../injection_containers/user_login_injection_containers/user_login_injection_container.dart';
import '../../bloc/login/userlogin_bloc.dart';
import '../../widgets/user_login_page_widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => ul<UserloginBloc>(),
        child: BlocBuilder<UserloginBloc, UserloginState>(
          builder: (context, state) {
            if (state is UserLoginProgressState) {
              return Stack(children: [
                Stack(
                  alignment: Alignment.center,
                  children: [LoginPageInitial(), logginInWidget()],
                ),
              ]);
            } else if (state is UserLoginFailureState) {
              return LoginFailure(message: state.message);
            } else if (state is UserLoginSuccessfulState) {
              return NavBar();
            }
            return LoginPageInitial();
          },
        ),
      ),
    );
  }
}

// Login Page Initial State
class LoginPageInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextStyle style = TextStyle(color: Colors.black);

    void _loginCheck(TextEditingController emailController,
        TextEditingController passwordController) {
      if (emailController.text != '' && passwordController.text != '') {
        BlocProvider.of<UserloginBloc>(context).add(LoginEvent(
            email: emailController.text, password: passwordController.text));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text('Invalid Input')));
      }
    }

    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.only(top: 48, bottom: 40),
        child: CircleAvatar(radius: 90, backgroundColor: Colors.white10),
      ),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              buildTextField(controller: emailController, hintText: 'Email')),
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: buildTextField(
              controller: passwordController, hintText: 'Password')),
      Padding(
        padding: EdgeInsets.all(30.0),
        child: InkWell(
          onTap: () => _loginCheck(emailController, passwordController),
          child: buildLargeButton(child: 'Log In', icon: Icons.lock_open),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Need an account? ', style: style),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {},
            child: Text('Register',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    ]));
  }
}

// Login Page failure state
class LoginFailure extends StatelessWidget {
  final String message;

  const LoginFailure({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: FutureBuilder(builder: (context, snapshot) {
        return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ));
      }),
      body: LoginPageInitial(),
    );
  }
}
