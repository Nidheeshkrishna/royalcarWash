import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:royal_car_wash_customer_app/widgets/Registeration_widget.dart';

class RegisterationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double screenWidth =
        MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top;
    return Scaffold(
        body: Container(
            width: screenWidth,
            height: screenHeight,
            child:RegisterationWidget()
            ));
            
  }
 
}
