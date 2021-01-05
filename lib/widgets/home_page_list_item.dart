import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/models/spaceListModel.dart';
import 'package:royal_car_wash_customer_app/network/spacelistRest.dart';
import 'package:royal_car_wash_customer_app/pages/details_page.dart';
import 'package:royal_car_wash_customer_app/widgets/product_item_list.dart';

// ignore: camel_case_types
class home_page_list_item extends StatefulWidget {
  //final List<Map<String, Object>> detailes;
  final String spaceId;
  //final String spaceName;
  home_page_list_item(this.spaceId);

  @override
  _home_page_list_itemState createState() => _home_page_list_itemState();
}

// ignore: camel_case_types
class _home_page_list_itemState extends State<home_page_list_item> {
  SpaceListModel spaceListModel;
  String spaceId;
  void initState() {
    super.initState();
    setState(() {
      if (widget.spaceId.isEmpty) {
        spaceId = "8";
      } else {
        spaceId = widget.spaceId ?? "8";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SpaceListModel>(
      future: fetchSpace(spaceId),
      builder: (BuildContext context, AsyncSnapshot<SpaceListModel> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.result.length,
              itemBuilder: (BuildContext context, int index) {
                //Map<String, Object> hashmap = detailes[index]['product'];

                return Center(
                  child: Card(
                      elevation: 50,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.network(
                                  snapshot.data.result[index].spaceImage
                                      .toString(),
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          snapshot
                                              .data.result[index].spaceName,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  46, 79, 101, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      )),
                                      Container(
                                          child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 10),
                                        child: Center(
                                          child: Text(
                                            snapshot.data.result[index]
                                                .spaceAddress,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    46, 79, 101, 1),
                                                fontSize: 14),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          product_item_list(),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 40,
                                child: RaisedButton(
                                  elevation: 10,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                details_page()));
                                  },
                                  color: Color.fromRGBO(46, 79, 101, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                      side: BorderSide(
                                        color: Color.fromRGBO(46, 79, 101, 1),
                                      )),
                                  child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              });
        } else {
          return Container();
        }
      },
    );
  }
}
