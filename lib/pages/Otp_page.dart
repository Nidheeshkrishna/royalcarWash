import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:royal_car_wash_customer_app/network/CheckOtpRest.dart';
import 'package:royal_car_wash_customer_app/network/ResendOtpRest.dart';
import 'package:royal_car_wash_customer_app/pages/login_page.dart';
import 'package:royal_car_wash_customer_app/pages/registeration_page.dart';

// ignore: must_be_immutable
class OtpPage extends StatefulWidget {
  final String customerId;
  final String otp;
  String status;
  String resendStatus;

  OtpPage(this.customerId, this.otp);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String enteredOtp;

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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RegisterationPage()));
        },
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text("Otp Verification",
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
      body: Center(
        child: Container(
          height: contentHeight * .30,
          width: contentWidth,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: contentWidth,
              height: contentHeight * .20,
              child: OtpTextField(
                numberOfFields: 6,
                
                
                borderColor: Colors.blueGrey,
                disabledBorderColor: Colors.grey,
                enabledBorderColor: Colors.blueGrey,
                showFieldAsBox:
                    true, //set to true to show as box or false to show as dash
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  setState(() {
                    enteredOtp = verificationCode;
                  });
                }, // end onSubmit
              ),
            ),
            RaisedButton(
                color: Color.fromRGBO(46, 79, 101, 1),
                disabledColor: Color.fromRGBO(46, 79, 101, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Color.fromRGBO(46, 79, 101, 1),
                    )),
                onPressed: () {
                  print(widget.customerId);
                  checkotp(enteredOtp, widget.customerId)
                      .then((value) => setState(() {
                            widget.status = value.status;
                          }));
                  if (widget.status == "true") {
                    CircularProgressIndicator(
                      strokeWidth: 2,
                    );
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => login_page()));
                  } else {
                    showMessages("Invalid Otp");
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              children: [
                InkWell(
                  child: Text("Resend Otp",style: TextStyle(color: Color.fromRGBO(
                                                  45, 97, 135, 1)),),
                  onTap: () {
                    resendotp(widget.customerId).then((value) => setState(() {
                          widget.resendStatus = value.status;
                        }));
                    CircularProgressIndicator(
                      strokeWidth: 2,
                    );
                    if (widget.resendStatus == "false") {
                      showMessages("click Resend Again");
                    }
                  },
                )
              ],
            )
          ]),
        ),
      ),
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
