import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:royal_car_wash_customer_app/pages/main_home_page.dart';

import 'package:royal_car_wash_customer_app/widgets/preview_list_widget.dart';

// ignore: camel_case_types
class preview_page extends StatefulWidget {
  @override
  _preview_pageState createState() => _preview_pageState();
}

// ignore: camel_case_types
class _preview_pageState extends State<preview_page> {
  // ignore: non_constant_identifier_names
  bool product_list_visibility = true;
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
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
      backgroundColor: Colors.white,
      title: Text("Preview",
          style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(45, 97, 135, 1),
              fontWeight: FontWeight.bold)),
    );
    double contentHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Container(
          width: contentWidth,
          height: contentHeight,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Text(
                      "Jan 02,2021 To Aug 02,2021",
                      style: TextStyle(
                        color: Color.fromRGBO(45, 97, 135, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 10),
                    child: Text("Contract",
                        style:
                            TextStyle(color: Color.fromRGBO(45, 97, 135, 1))),
                  )
                ],
              ),
              Card(
                elevation: 10,
                child: InkWell(
                  child: ExpansionTile(
                    title: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Dubai-B-2834",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(45, 97, 135, 1),
                              fontWeight: FontWeight.bold),
                        )),
                    leading: InkWell(
                      child: Text(
                        "Dodge Challenger\nTotal:60 Aed",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(45, 97, 135, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          product_list_visibility = false;
                        });
                      },
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Card(
                          elevation: 10,
                          child: ListTile(
                            title: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Dubai-B-2834",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 97, 135, 1)),
                                )),
                            leading: Text(
                              "Dodge Challenger\nTotal:60 Aed",
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 97, 135, 1),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 50,
                                height: 100,
                                child: Card(
                                    elevation: 10,
                                    color: Colors.red,
                                    child: Icon(Icons.delete,
                                        size: 20, color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      product_list_visibility = false;
                    });
                  },
                ),
              ),
              Column(
                children: <Widget>[PreviewListWidget()],
              )
            ]),
          )),
    );
  }
}
