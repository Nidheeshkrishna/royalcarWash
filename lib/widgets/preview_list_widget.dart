import 'dart:ui';

import 'package:flutter/material.dart';

class PreviewListWidget extends StatefulWidget {
  @override
  _PreviewListWidgetState createState() => _PreviewListWidgetState();
}

class _PreviewListWidgetState extends State<PreviewListWidget> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    //double contentHeight = MediaQuery.of(context).size.height;
    double contentWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Card(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(dummyData[1]['image_url'],
                        width: 80, height: 100),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              dummyData[1]['Company_name'],
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 79, 101, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                          width: 280,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 10),
                            child: Text(
                              dummyData[1]['address'],
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color.fromRGBO(46, 79, 101, 1),
                                  fontSize: 12),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "slot1 | 8:20 Am",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(46, 79, 101, 1),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                //width:MediaQuery.of(context).size.width * ,
                height: MediaQuery.of(context).size.height * .20,
                child: ListView.separated(
                    itemCount: product.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        new Divider(),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(product[index]['p_name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color.fromRGBO(46, 79, 101, 1))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(product[index]['amount'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Color.fromRGBO(46, 79, 101, 1))),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                product[index]['title'],
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                  width: 60,
                                  height: 20,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  )),
                            ),
                          ],
                        )
                      ]);
                    }),
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 20,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                              color: Color.fromRGBO(46, 79, 101, 1))),
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.redAccent,
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.add,
                              size: 12, color: Color.fromRGBO(46, 79, 101, 1)),
                          Text("Add More",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(46, 79, 101, 1))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(46, 79, 101, 1))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("60 Aed",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(46, 79, 101, 1))),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: contentWidth,
            height: 50,
            child: Card(
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Payment:',
                          style: TextStyle(
                              color: Color.fromRGBO(46, 79, 101, 1),
                              fontSize: 13)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
                    new Text('PAY NOW',style: TextStyle(
                              color: Color.fromRGBO(46, 79, 101, 1),
                              fontSize: 12)),
                    Radio(
                      activeColor:Color.fromRGBO(46, 79, 101, 1) ,
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text('PAY LATER',style: TextStyle(
                              color: Color.fromRGBO(46, 79, 101, 1),
                              fontSize: 12)),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
                      width: contentWidth,
                      height: 40,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              width: 2,
                                color: Color.fromRGBO(46, 79, 101, 1))),
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.redAccent,
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            
                            Text("Add More Vehicle",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(46, 79, 101, 1))),
                          ],
                        ),
                      ),
                    ),
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: contentWidth,
              height: 30,
              child: RaisedButton(
                onPressed: () {},
                color: Color.fromRGBO(46, 79, 101, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(
                      color: Color.fromRGBO(46, 79, 101, 1),
                    )),
                child: Text(
                  "Pay Now(60 Aed)",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),
      ],
    );
    
  }

  final List<Map<String, Object>> dummyData = [
    {
      'id': '1',
      'Company_name': 'AL-NASER CAR WASH CENTER',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/carwash1.jpg',
    },
    {
      'id': '2',
      'Company_name': 'NASEER CAR CLINIC',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/carwash2.jpg',
    },
    {
      'id': '3',
      'Company_name': 'AL-BARAKA CAR BATH',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/NoPath.png'
    }
  ];

  final List<Map<String, Object>> product = [
    {
      'pid': '1',
      'p_name': 'shine',
      'title': 'Trash bag,Tissue pack,Perfuming,Floormat casing',
      'amount': "20 Aed"
    },
    {
      'pid': '2',
      'p_name': 'Detailing',
      'title': 'Trash bag,Tissue pack,Perfuming,Floormat casing',
      'amount': "40 Aed"
    },
  ];

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          //_result = ...

          break;
        case 1:
          break;
        case 2:
          // _result = ...
          break;
      }
    });
  }
}
