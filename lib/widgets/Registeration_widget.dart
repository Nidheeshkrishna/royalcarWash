import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:royal_car_wash_customer_app/models/RegisterationModel.dart';
import 'package:royal_car_wash_customer_app/network/Registertion_rest.dart';
import 'package:royal_car_wash_customer_app/pages/Otp_page.dart';

class RegisterationWidget extends StatefulWidget {
  @override
  _RegisterationWidgetState createState() => _RegisterationWidgetState();
}

class _RegisterationWidgetState extends State<RegisterationWidget> {
  final _formKey = GlobalKey<FormState>();
  Future<RegisterationModel> futureRegisteration;
  RegisterationModel registerationData;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  var confirmPass;
  bool isload = false;

  int status;
  int custid;
  int custotp;
  // bool _isloading = false;

  //bool _loading = true;

  SnackBar snackBar;

  @override
  void initState() {
    super.initState();
  }

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
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          // ignore: deprecated_member_use
          autovalidate: true,
             autovalidateMode: AutovalidateMode.always,

          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(45, 97, 135, 1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset("assets/images/Mask Group 13.png"),
                      )
                    ],
                  ),
                ],
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
                              fontSize: 18),
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
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 30, bottom: 10),
                        child: Text("Your Name",
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
                        controller: nameController,
                        validator: (value) =>
                            value.isEmpty ? 'Enter Your Name' : null,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
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
                            top: 10, left: 30, bottom: 10),
                        child: Text("Address",
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
                        controller: addressController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Address',
                          hintStyle: TextStyle(color: Colors.grey),
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
                            top: 10, left: 30, bottom: 10),
                        child: Text("Email",
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
                        controller: emailController,
                        validator: (value) =>
                            value.isEmpty ? 'Enter Your Email' : null,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.grey,
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
                              color: Color.fromRGBO(45, 97, 135, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, bottom: 10),
                        child: Text("Mobile Number",
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
                        controller: mobileController,
                        validator: (value) =>
                            value.isEmpty ? 'Enter Your Mobile Number' : validateEmail(value),
                        decoration: const InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey,
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
                            top: 10, left: 30, bottom: 10),
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
                        controller: passwordController,
                        validator: (String value) {
                          confirmPass = value;
                          if (value.isEmpty) {
                            return "Please Enter New Password";
                          } else if (value.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else {
                            return null;
                          }
                        },
                        // onSaved: (value) => _email = value,

                        //controller: PasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: const ImageIcon(
                            const AssetImage('assets/images/padlock.png'),
                            color: Colors.grey,
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
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, bottom: 10),
                        child: Text("Confirm Password",
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
                        controller: confirmpasswordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (value.length < 8) {
                            return "Password must be atleast 8 characters long";
                          } else if (value != confirmPass) {
                            return "Password must be same as above";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Confirm Password',
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
                        padding: const EdgeInsets.only(
                            top: 10, left: 30, bottom: 20),
                        child: Row(
                          children: [
                            Text("Already Have an Account?",
                                style: TextStyle(
                                    color: Color.fromRGBO(45, 97, 135, 1))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("SIGN IN",
                                  style: TextStyle(
                                      color: Color.fromRGBO(45, 97, 135, 1))),
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 80,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 20),
                        child: RaisedButton(
                            color: Color.fromRGBO(46, 79, 101, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                  color: Color.fromRGBO(46, 79, 101, 1),
                                )),
                            onPressed: () async {
                              //showLoaderDialog(context);
                              progressDialog.show();
                              setState(() {
                                isload = true;
                              });
                              if (_formKey.currentState.validate()) {
                                createCustomer(
                                        nameController.text,
                                        addressController.text,
                                        emailController.text,
                                        passwordController.text)
                                    .then((value) => setState(() {
                                          status = value.customerStatus;
                                          custid = value.customerId;
                                          custotp = value.customerOtp;
                                        }))
                                    .whenComplete(() => {
                                          if (status == 1)
                                            {
                                              progressDialog.dismiss(),
                                              showMessages(
                                                  "Registered Successfully"),
                                              setState(() {
                                                isload = false;
                                              }),
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OtpPage(
                                                              custid.toString(),
                                                              custotp
                                                                  .toString())))
                                            }
                                          else if (status == 0)
                                            {
                                              //dialogDismiss(context, status);
                                              progressDialog.dismiss(),
                                              showMessages(
                                                  "Already Registered User"),
                                              setState(() {
                                                isload = false;
                                              }),
                                            }
                                          else
                                            {}
                                        });
                              } else {
                                progressDialog.dismiss();
                              }
                            },
                            child: const ImageIcon(
                                const AssetImage(
                                  'assets/images/right.png',
                                ),
                                color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void dialogDismiss(BuildContext context, int status) {
    if (status == 0) {
      showMessages("Registeration failed");
      Navigator.pop(context);
    }
  }

  void fieldFocusChange(BuildContext context, FocusNode currentFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(currentFocus);
  }

  showMessages(String messages) async {
    Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightBlue[700],
        textColor: Colors.white);
  }

  // ignore: non_constant_identifier_names

  showLoaderDialog(
    BuildContext context,
  ) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularProgressIndicator(),
          Center(child: Text("Please wait...."))
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }
}
