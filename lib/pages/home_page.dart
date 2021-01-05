import 'dart:ui';

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/models/EmiratesModel.dart';
import 'package:royal_car_wash_customer_app/models/spaceListModel.dart';
import 'package:royal_car_wash_customer_app/network/Emirates_rest.dart';

import 'package:royal_car_wash_customer_app/pages/add_vehicle.dart';


import 'package:royal_car_wash_customer_app/pages/select_area_page.dart';
import 'package:royal_car_wash_customer_app/widgets/home_page_list_item.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  @override
  _home_page_State createState() => _home_page_State();
  final String locationId;
  final String locationName;
  homePage(this.locationId, this.locationName);
}

// ignore: camel_case_types
class _home_page_State extends State<homePage> {
  //int _currentIndex = 0;
  // ignore: non_constant_identifier_names
  EmiratesModel EmiratesNames;
  SpaceListModel spaceListModel;
  TextEditingController controller = TextEditingController();
  //String txt_areaName = "Select Area";
  @override
  void initState() {
    super.initState();

    setState(() {
      // txt_areaName = widget.location_name;
      controller.text = widget.locationName;
    });
    fetchEmirates().then((emirates) {
      setState(() {
        EmiratesNames = emirates;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
     
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Home Page",
          style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(45, 97, 135, 1),
              fontWeight: FontWeight.bold,)),
    );
    double contentHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Container(
              width: contentWidth,
              height: contentHeight,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        color: Colors.white,
                        width: contentWidth * .67,
                        height: 40,
                        child: Row(
                          children: [
                            InkWell(
                                child: Container(
                                   width: contentWidth * .67,
                        height: 40,
                                  child: AutoSizeTextField(
                                    minFontSize: 16,
                                    controller: controller,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      suffixIcon: InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0, right: 20),
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.blueGrey,
                                              size: 30.0,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        select_area_page()));
                                          }),
                                      hintText: 'Select Area',
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              select_area_page()));
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: contentWidth * .43,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddVehicle()));
                        },
                        color: Color.fromRGBO(46, 79, 101, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color.fromRGBO(46, 79, 101, 1),
                            )),
                        child: Text(
                          "SELECT/ADD VEHICLE",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                          // width:content_width,
                          height: contentHeight * .80,
                          child: home_page_list_item(widget.locationId)),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  
  
}
