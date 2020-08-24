import 'package:Fantasy_V_Clean_Arch/core/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_containers/user_login_injection_containers/user_login_injection_container.dart';
import '../../bloc/login/bloc/userlogin_bloc.dart';
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
                  children: [LoginPageInitial(), LogginInWidget()],
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
        padding: EdgeInsets.only(top: 48),
        child: CircleAvatar(radius: 90, backgroundColor: Colors.white10),
      ),
      SizedBox(height: 50),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 280,
            padding: EdgeInsets.only(left: 20, right: 10),
            decoration: BoxDecoration(
                color: Color(0xFFeeeeee),
                borderRadius: BorderRadiusDirectional.circular(35)),
            child: TextField(
              onSubmitted: (_) {},
              style: TextStyle(color: Colors.black),
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail, color: Colors.black),
                suffix: GestureDetector(
                    onTap: () => emailController.text = '',
                    child: Icon(Icons.clear, color: Colors.black, size: 18)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            width: 280,
            padding: EdgeInsets.only(left: 20, right: 10),
            decoration: BoxDecoration(
                color: Color(0xFFeeeeee),
                borderRadius: BorderRadiusDirectional.circular(35)),
            child: TextField(
              onSubmitted: (_) {},
              style: TextStyle(color: Colors.black),
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key, color: Colors.black),
                suffix: GestureDetector(
                    onTap: () {
                      passwordController.text = '';
                    },
                    child: Icon(Icons.clear, color: Colors.black, size: 18)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            )),
      ),
      Padding(
        padding: EdgeInsets.all(30.0),
        child: InkWell(
          onTap: () => _loginCheck(emailController, passwordController),
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.lock_open),
                  SizedBox(width: 10),
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            width: 120,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(30)),
          ),
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
