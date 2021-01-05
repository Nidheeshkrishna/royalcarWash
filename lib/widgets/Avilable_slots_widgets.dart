import 'package:flutter/material.dart';

import 'package:royal_car_wash_customer_app/widgets/slots_text.dart';

// ignore: camel_case_types
class Avilable_slots_widgets extends StatefulWidget {
  @override
  _Avilable_slots_widgetsState createState() => _Avilable_slots_widgetsState();
}

// ignore: camel_case_types
class _Avilable_slots_widgetsState extends State<Avilable_slots_widgets> {
  // ignore: non_constant_identifier_names
  int slot_count;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        mainAxisSpacing: 1,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 150,
          height: 100,
          child: Column(
            children: [
              RaisedButton(
                  onPressed: () {},
                  color: Color.fromRGBO(90, 140, 246, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(
                        color: Colors.blue,
                      )),
                  child: SlotsText(index)),
            ],
          ),
        );
      },
    );
  }
}
