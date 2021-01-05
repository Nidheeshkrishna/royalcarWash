import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/models/serviceListModel.dart';
import 'package:royal_car_wash_customer_app/network/AddToCartRest.dart';
import 'package:royal_car_wash_customer_app/network/ServiceListRest.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class product_item_list extends StatefulWidget {
  @override
  _product_item_listState createState() => _product_item_listState();
}

// ignore: camel_case_types
class _product_item_listState extends State<product_item_list> {
  final snackBarSuccessCart = SnackBar(
    content: Text("Added  Your Service to Cart!",
        style: TextStyle(fontSize: 14, color: Colors.white)),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.green,
  );
  final snackBarfailedCart = SnackBar(
    content: Text("Your Service is Not added!",
        style: TextStyle(fontSize: 14, color: Colors.white)),
    backgroundColor: Colors.red[400],
    duration: Duration(seconds: 5),
  );
  var prefs;
  static var customerId;
  String serviceId;

  prefcheck() async {
    // ignore: invalid_use_of_visible_for_testing_member
    // SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();

    setState(() {
      customerId = prefs.getString('User_id' ?? "0");
    });
    print(prefs.getString('User_id' ?? "0"));
  }

  ServiceListModel serviceListModel;
  @override
  void initState() {
    super.initState();

    fetchServices().then((product) {
      setState(() {
        serviceListModel = product;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //double contentHeight = MediaQuery.of(context).size.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<ServiceListModel>(
        future: fetchServices(),
        builder: (context, AsyncSnapshot<ServiceListModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data.result.length,
                separatorBuilder: (BuildContext context, int index) =>
                    new Divider(
                      color: Colors.blueGrey,
                      thickness: .5,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(snapshot.data.result[index].serviceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromRGBO(46, 79, 101, 1))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                              snapshot.data.result[index].serviceRatePerHour
                                      .toString() +
                                  "\r Aed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color.fromRGBO(46, 79, 101, 1))),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: contentWidth * .70,
                              // height: contentHeight* .10,
                              child: Text(
                                snapshot.data.result[index].serviceDetails,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 2.0),
                          child: Container(
                            width: 70,
                            height: 25,
                            child: RaisedButton(
                              elevation: 10,
                              //color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(46, 79, 101, 1))),
                              onPressed: () {
                                prefcheck();
                                AddToCartService(
                                        customerId,
                                        snapshot.data.result[index].serviceId
                                            .toString(),
                                        snapshot.data.result[index]
                                            .serviceRatePerHour
                                            .toString())
                                    .then(
                                             (value) => value.status
                                      ? Scaffold.of(context)
                                          .showSnackBar(snackBarSuccessCart)
                                      : Scaffold.of(context)
                                          .showSnackBar(snackBarfailedCart),
                                );
                              } ,
                              highlightColor: Colors.blue[100],
                              textColor: Colors.redAccent,
                              disabledColor: Colors.white,

                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(Icons.add,
                                      size: 15,
                                      color: Color.fromRGBO(46, 79, 101, 1)),
                                  Text("Add",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(46, 79, 101, 1))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]);
                });
          } else {
            return Container(
                child: Center(
              child: Text("Service stations are not avilable"),
            ));
          }
        });
  }
}
