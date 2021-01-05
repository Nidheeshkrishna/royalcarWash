import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/pages/MyOrder.dart';
import 'package:royal_car_wash_customer_app/pages/home_page.dart';


class ProfileTabWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .60,
      child: DefaultTabController(
length: 4,
child: Scaffold(
appBar: AppBar(
  backgroundColor: Colors.white,
  flexibleSpace: new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TabBar(
          
          indicatorColor: Colors.blueGrey,
          labelColor: Colors.blueGrey,
          unselectedLabelColor: Colors.grey,
          
          tabs: [
       Tab(text: "My Orders"),
       Tab(text: "Vehicle"),
       Tab(text: "Terms and Conditions"),
       Tab(text: "Help",)
          ],
        )
      ],
  ),
),
body: TabBarView(
  children: [
      MyOrderPage(),
   homePage("",""),
      MyOrderPage(),
       MyOrderPage(),
  ],
   ),
   ),
 ),
    );
  }
}
