import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:royal_car_wash_customer_app/models/LoginModel.dart';
import 'package:royal_car_wash_customer_app/network/login_page_rest.dart';
import 'package:royal_car_wash_customer_app/pages/main_home_page.dart';
import 'package:royal_car_wash_customer_app/pages/registeration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class  Login_Widget extends StatefulWidget {
  @override
  Login_State createState() => Login_State();
}

// ignore: camel_case_types
class Login_State extends State<Login_Widget> {
  Future<LoginModel> futureLogin;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel response;
  bool netWorkStatus;
  int customerStatus;
  bool isload = false;
  SnackBar snackBar;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 70, left: 40),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(45, 97, 135, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Image.asset(
                                      "assets/images/Mask Group 13.png"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Text(
                                  "Welcome Back,",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 97, 135, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              top: 20,
                            ),
                            child: Text("Royal Car Wash",
                                style: TextStyle(
                                    color: Color.fromRGBO(45, 97, 135, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 30, bottom: 10),
                                child: Text("Username",
                                    style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              elevation: 5,
                              child: TextFormField(
                                validator: (value) =>
                                    value.isEmpty ? 'Enter your User Name' : null,
                                controller: userNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Your User Name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(Ionicons.ios_person,color: Colors.red,),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(45, 97, 135, 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 50, left: 30, bottom: 10),
                                child: Text("Password",
                                    style: TextStyle(
                                        color: Color.fromRGBO(45, 97, 135, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Card(
                              elevation: 5,
                              child: TextFormField(
                                validator: (value) =>
                                    value.isEmpty ? 'Enter Your Password ' : null,
                                // onSaved: (value) => _email = value,

                                controller: passwordController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: const ImageIcon(
                                    const AssetImage('assets/images/padlock.png'),
                                    color: Color.fromRGBO(45, 97, 135, 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(45, 97, 135, 1)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10, left: 30),
                                child: Row(
                                  children: [
                                    Text("Forgot Password",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(45, 97, 135, 1))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        child: Text("SIGN IN",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 97, 135, 1))),
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterationPage()));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 30.0, top: 30),
                              child: Container(
                                  width: 60,
                                  height: 50,
                                  child: RaisedButton(
                                      color: Color.fromRGBO(46, 79, 101, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          side: BorderSide(
                                            color: Color.fromRGBO(46, 79, 101, 1),
                                          )),
                                      onPressed: () {
                                        showLoaderDialog(context);
                                        //check();
                                        //if (netWorkStatus == true) {
                                        if (_formKey.currentState.validate()) {
                                          loginCustomer(userNameController.text,
                                                  passwordController.text)
                                              .then((value) => setState(() {
                                                    customerStatus =
                                                        value.customerStatus;
                                                           Navigator.of(context).pop();
                                                  }));
                                    
                                          if (customerStatus == 1) {
                                             Navigator.of(_scaffoldKey.currentContext).pop();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MainHomePage()));
                                          } else if (customerStatus == 0) {
                                                 
                                            showMessages(
                                                "Invalid user Name And Passwor");
                                                 Navigator.of(_scaffoldKey.currentContext).pop();
                                          }
                                        }
                                        //} else {
                                        //showMessages(
                                        // "Please check your Network");
                                        //}
                                      },
                                      child: const ImageIcon(
                                          const AssetImage(
                                            'assets/images/right.png',
                                          ),
                                          color: Colors.white))),
                            ),
                          )
                        ],
                      )
                    ],
                  
      
    );
  }
   showLoaderDialog(
    BuildContext context,
  ) {
    AlertDialog alert = AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .10,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProgressIndicator(),
            Center(child: Text("Please wait....")),
          
          ],
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alert;
      },
    );
    
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