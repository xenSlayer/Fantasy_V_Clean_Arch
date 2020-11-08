import 'package:flutter/material.dart';

class Pitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage('assets/pitch.png'))),
    );
  }
}
