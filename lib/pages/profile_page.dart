import 'package:flutter/material.dart';

import 'package:royal_car_wash_customer_app/widgets/profile_tabs_widgets.dart';

class ProfilePage extends StatelessWidget {
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
         // Navigator.pushReplacement(
              //context, MaterialPageRoute(builder: (context) => MainHomePage()));
        },
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Profile",
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromRGBO(45, 97, 135, 1),
                        child: CircleAvatar(
                          backgroundImage:
                              ExactAssetImage('assets/images/person.jpg'),
                          //child: Image.asset('assets/images/person.jpg',width:30,fit: BoxFit.cover,),
                          //backgroundImage:Image.asset('assets/images/list.png'),
                          radius: 55,

                          //backgroundColor: Colors.transparent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "AJMAL ANSARI",
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 97, 135, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "ajmalansari1122@gmail.com",
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 97, 135, 1),
                                  fontSize: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "21447 - sheikh Mohammad Bin Rashid Blvd\nDowntown Dubai- United Arab Emirates",
                                style: TextStyle(
                                    color: Color.fromRGBO(45, 97, 135, 1),
                                    fontSize: 11),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                width: 50,
                                height: 15,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(46, 79, 101, 1))),
                                  onPressed: () {},
                                  color: Colors.white,
                                  textColor: Colors.redAccent,
                                  child: Row(
                                    // Replace with a Row for horizontal icon + text
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Edit",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color.fromRGBO(
                                                  46, 79, 101, 1))),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
              ProfileTabWidgets()
            ],
          )),
    );
  }
}
