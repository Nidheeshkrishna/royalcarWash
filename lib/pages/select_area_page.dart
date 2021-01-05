import 'package:flutter/material.dart';


import 'package:royal_car_wash_customer_app/pages/main_home_page.dart';
import 'package:royal_car_wash_customer_app/widgets/select_area_list_widget.dart';

// ignore: camel_case_types
class select_area_page extends StatefulWidget {
  @override
  _select_area_page_State createState() => _select_area_page_State();
}

// ignore: camel_case_types
class _select_area_page_State extends State<select_area_page> {

  
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.white,
      leading: InkWell(
        child: Icon(
          Icons.arrow_back,
          color: Color.fromRGBO(45, 97, 135, 1),
          size: 20.0,
        ),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainHomePage()));
        },
      ),
      centerTitle: true,
      title: Text(
        "Select Area",
        style: TextStyle(color: Color.fromRGBO(45, 97, 135, 1)),
      ),
    );
    double contentHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Container(
         
          width: contentWidth,
          height: contentHeight,
          child: Column(
            children: <Widget>[SelectAreaListWidget()],
          )),
    );
  }
}
