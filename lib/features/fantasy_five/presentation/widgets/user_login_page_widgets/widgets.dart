import 'package:flutter/material.dart';

class LogginInWidget extends StatelessWidget {
  const LogginInWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber.withOpacity(0.6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loggin in',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          )),
    );
  }
}
