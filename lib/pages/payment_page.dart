import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/pages/details_page.dart';
class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
       leading: InkWell(
        child: Icon(
          Icons.arrow_back,
          color: Color.fromRGBO(45, 97, 135, 1),
          size: 20.0,
        ),
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => details_page()));
        },
      ),
      title: Text("Payment",style: TextStyle( color: Color.fromRGBO(45, 97, 135, 1)),),
    );
    double contentHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
          body: Container(
        width: contentWidth,
        height: contentHeight,
        child:Column(children: <Widget>[
           Center(
             child: Image.asset("assets/images/COMPANY LOGO.png",
                width: 200, height: 200),
           ),
         SingleChildScrollView(
                    child: Container(
             width: contentWidth,
             height: contentHeight * .60,
             child: ListView.builder( 
        itemCount:dummyData.length, 
        itemBuilder: (BuildContext context,int index){ 
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                              child: ListTile( 
                    leading: Image.asset(dummyData[index]["image_url"],width:50,height: 50,), 
                    
                    title:Text(dummyData[index]["txt"],style: TextStyle( color: Color.fromRGBO(45, 97, 135, 1))) 
             
                   
                    ),
                ),
              );
        }
               
        ),
           ),
         )
        ],)
        
      ),
    );
  }

  final List<Map<String, Object>> dummyData = [
    {
      'id': '1',
      'txt': 'CARD',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/p1.png',
    },
    {
      'id': '2',
      'txt': 'UpI',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/p2.png',
    },
    {
      'id': '3',
      'txt': 'NetBanking',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/p3.png'
    },
     {
      'id': '5',
      'txt': 'Wallet',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/p6.png'
    },
    {
      'id': '4',
      'txt': 'PayLater',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/p4.png'
    }
    
  ];
}