import 'package:flutter/material.dart';

class CaptainBand extends StatelessWidget {
  const CaptainBand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: Center(
        child: Text(
          'C',
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(100)),
    );
  }
}
