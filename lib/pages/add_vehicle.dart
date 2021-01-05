import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:royal_car_wash_customer_app/models/getVehicleModel.dart';
import 'package:royal_car_wash_customer_app/network/SaveVehicleRest.dart';
import 'package:royal_car_wash_customer_app/network/getVehicleRest.dart';
import 'package:royal_car_wash_customer_app/pages/main_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVehicle extends StatefulWidget {
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  List<GetVehicleModel> otherStatuses;
  List<Map<String, GetVehicleModel>> monitorList = new List();
  GetVehicleModel getVehicleModel;
  // ignore: non_constant_identifier_names
  bool status_check;
  var cid;

  final _formKey1 = GlobalKey<FormState>();
  bool ready = false;
  // ignore: non_constant_identifier_names
  bool show_button;
  var map1;
  SharedPreferences prefs;
  static String customerId;
  dynamic token;

  @override
  void initState() {
    prefcheck();
    setState(() {
      ready = false;
      show_button = true;

      //cid = customerId;
    });
    // print({"cid$cid"});
    // fetchVehicle(customerId.toString().trim()).then((areaData) {
    //   setState(() {
    //     getVehicleModel = areaData;
    //   });
    // });
    super.initState();
  }

  prefcheck() async {
    // ignore: invalid_use_of_visible_for_testing_member
    //SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    token = await FlutterSession().get("custid");
    setState(() {
      customerId = prefs.getString('User_id') ?? "0";
      //cid = token.toString();
    });
    //print("cid$cid");
    print("customerid$customerId");
    return customerId;
  }

  final snackBarSuccess = SnackBar(
    content: Text("Added  Your Vehicle!",
        style: TextStyle(fontSize: 14, color: Colors.white)),
    duration: Duration(seconds: 5),
    backgroundColor: Colors.green,
  );
  final snackBarfailed = SnackBar(
    content: Text("Your Vehicle is Not added!",
        style: TextStyle(fontSize: 14, color: Colors.white)),
    backgroundColor: Colors.red[400],
    duration: Duration(seconds: 5),
  );
  @override
  Widget build(BuildContext context) {
    ArsProgressDialog progressDialog = ArsProgressDialog(context,
        blur: 2,
        loadingWidget: Container(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            strokeWidth: 5,
          ),
        ),
        backgroundColor: Color(0x33000000),
        animationDuration: Duration(milliseconds: 300));

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
      title: Text("Add Vehicle",
          style: TextStyle(
              fontSize: 16.0,
              color: Color.fromRGBO(45, 97, 135, 1),
              fontWeight: FontWeight.bold)),
    );
    double contentWidth = MediaQuery.of(context).size.width;
    double contentHight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: appbar,
        body: Form(
          key: _formKey1,
          child: SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder<GetVehicleModel>(
                            future:
                                fetchVehicle(prefs.getString('User_id') ?? "0"),
                            builder: (context,
                                AsyncSnapshot<GetVehicleModel> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.result.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, right: 30,top:5),
                                            child: Container(
                                              width: contentWidth,
                                              height: 40,
                                              child: Card(
                                                elevation: 10,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                        snapshot
                                                            .data
                                                            .result[index]
                                                            .vehicleName,
                                                        style: TextStyle(
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromRGBO(
                                                              45, 97, 135, 1),
                                                        )),
                                                    Text(
                                                        snapshot
                                                            .data
                                                            .result[index]
                                                            .vehiclePlateNo,
                                                        style: TextStyle(
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromRGBO(
                                                              45, 97, 135, 1),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                return Container();
                              }
                            })
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: true,
                  fillOverscroll:
                      true, // Set true to change overscroll behavior. Purely preference.
                  child: Column(
                    children: [
                      Visibility(
                        visible: show_button,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: contentWidth,
                            child: RaisedButton(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.grey)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                      child: Text(
                                        "Add Your Vehicle To Help Workers To Find It Easy",
                                        style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onPressed: () {
                                setState(() {
                                  ready = true;
                                  show_button = false;
                                });
                                //addItemToList();
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        child: Container(
                          width: contentWidth,
                          height: contentHight * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Card(
                              elevation: 15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text("Vehicle Name:"),
                                      ),
                                      Container(
                                          width: contentWidth * .60,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Card(
                                              elevation: 10,
                                              child: TextFormField(
                                                controller:
                                                    vehicleNameController,
                                                validator: (value) => value
                                                        .isEmpty
                                                    ? 'Enter your Vehichle Model Name'
                                                    : null,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'Enter Vehicle Model Name',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                2.0)),
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          45, 97, 135, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text("Vehicle Number:"),
                                      ),
                                      Container(
                                          width: contentWidth * .60,
                                          height: 50,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: Card(
                                              elevation: 10,
                                              child: TextFormField(
                                                controller:
                                                    vehicleNumberController,
                                                validator: (value) => value
                                                        .isEmpty
                                                    ? 'Enter your Vehicle Number'
                                                    : null,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'Enter Your Vehicle Number',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          45, 97, 135, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 30,
                                          child: RaisedButton(
                                            elevation: 10,
                                            onPressed: () {
                                              setState(() {
                                                ready = false;
                                                show_button = true;
                                              });

                                              if (_formKey1.currentState
                                                  .validate()) {
                                                progressDialog.show();

                                                // prefcheck();
                                                addVehicleService(
                                                        customerId,
                                                        vehicleNumberController
                                                            .text,
                                                        vehicleNameController
                                                            .text)
                                                    .then(
                                                        (value) => setState(() {
                                                              status_check =
                                                                  value.status;
                                                            }))
                                                    .whenComplete(() => {
                                                          if (status_check)
                                                            {
                                                                fetchVehicle(customerId),
                                                              vehicleNumberController
                                                                  .clear(),
                                                              vehicleNameController
                                                                  .clear(),
                                                              progressDialog
                                                                  .dismiss(),
                                                              showMessages(
                                                                  "Vehicle Added successfully"),
                                                              
                                                            }
                                                          else
                                                            {
                                                              progressDialog
                                                                  .dismiss(),
                                                              showMessages(
                                                                  "Vehicle Added failed"),
                                                              
                                                            }
                                                        });
                                              
                                              } else {
                                                progressDialog.dismiss();
                                              }
                                            },
                                            color:
                                                Color.fromRGBO(46, 79, 101, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      46, 79, 101, 1),
                                                )),
                                            child: Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        visible: ready,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  showMessages(String messages) async {
    Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightBlue[700],
        textColor: Colors.white);
  }
}
