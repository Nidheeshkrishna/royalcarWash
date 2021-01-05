import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royal_car_wash_customer_app/pages/login_page.dart';

// ignore: camel_case_types
class splash_screen_page extends StatefulWidget {
  @override
  _splash_screen_pageState createState() => _splash_screen_pageState();
}

// ignore: camel_case_types
class _splash_screen_pageState extends State<splash_screen_page> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login_page())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Center(
      child: Container(
          child: Image.asset("assets/images/COMPANY LOGO.png",
              width: 400, height: 400)),
    );
  }
}
