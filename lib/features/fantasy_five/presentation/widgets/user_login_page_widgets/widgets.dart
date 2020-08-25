import 'package:flutter/material.dart';

/// Logging in progress with circularProgress Indicator widget
Center logginInWidget() {
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

/// TextForm Field
/// buildTextField({ @required TextEditingController controller, @required String hintText )}
Container buildTextField({
  @required TextEditingController controller,
  @required String hintText,
  @required IconData icon,
}) {
  return Container(
      width: 280,
      padding: EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
          color: Color(0xFFeeeeee),
          borderRadius: BorderRadiusDirectional.circular(35)),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          suffix: GestureDetector(
              onTap: () => controller.text = '',
              child: Icon(Icons.clear, color: Colors.black, size: 18)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black54),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ));
}

/// Large button
///
/// Container buildLargeButton({String child, IconData icon})
Container buildLargeButton({String child, IconData icon}) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 10),
          Text(
            child,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
    width: 120,
    height: 50,
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(30)),
  );
}
