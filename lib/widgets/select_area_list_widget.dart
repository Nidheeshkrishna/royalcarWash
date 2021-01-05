import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/models/EmiratesModel.dart';
import 'package:royal_car_wash_customer_app/models/GetAreaModel.dart';
import 'package:royal_car_wash_customer_app/models/cities.dart';
import 'package:royal_car_wash_customer_app/network/Emirates_rest.dart';

import 'package:royal_car_wash_customer_app/widgets/area_sublist_widget.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
class SelectAreaListWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  @override
  _SelectAreaListWidgetState createState() => _SelectAreaListWidgetState();
}

class _SelectAreaListWidgetState extends State<SelectAreaListWidget> {
  // ignore: non_constant_identifier_names
  EmiratesModel EmiratesNames;
  GetAreaModel getareaData;
  String emirateName;
  bool selected = false;
  var lst = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      emirateName = "AbuDhabi";
    });
    fetchEmirates().then((emirates) {
      setState(() {
        EmiratesNames = emirates;
      });
    });
  }

  final List<String> cityName = ['Abudhabi', 'Dubai', 'Sharja'];

  List<Cities> dummyData = [
    Cities(place_name: [
      "Al Mafraq Industrial Area",
      'Abu Dhabi Media Co',
      'Abu Dhabi Bus Station'
    ], city: 'Abudhabi'),
    Cities(place_name: [
      "Al Mafraq Industrial Area",
      'Abu Dhabi Media Co',
      'Abu Dhabi Bus Station'
    ], city: 'Dubai'),
    Cities(place_name: [
      "Al Mafraq Industrial Area",
      'Abu Dhabi Media Co',
      'Abu Dhabi Bus Station'
    ]),
    Cities(place_name: [
      "Al Mafraq Industrial Area",
      'Abu Dhabi Media Co',
      'Abu Dhabi Bus Station'
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*.90,
      child: Card(
        elevation: 10,
        child: FutureBuilder<EmiratesModel>(
            future: fetchEmirates(),
            builder: (context, AsyncSnapshot<EmiratesModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.result.length,
                  itemBuilder: (_, index) {
                    return Container(
                      
                      child: InkWell(
                        child: Card(
                          elevation: 10,
                          child: ExpansionTile(
                                title: Text(snapshot.data.result[index].emirates
                                    .toString()),
                                children: <Widget>[
                                Container(
                                 width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * .20,
                                  child: AreaSublist(snapshot.data.result[index].emirates
                                    .toString()))
                                             
                                ]),
                        ),
                       
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }

  void changed() {}
}
