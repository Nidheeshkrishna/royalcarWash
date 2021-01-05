import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/models/GetAreaModel.dart';
import 'package:royal_car_wash_customer_app/pages/home_page.dart';

import 'package:royal_car_wash_customer_app/network/GetAreaRest.dart';

class AreaSublist extends StatefulWidget {
  final String _emirateName;

  AreaSublist(this._emirateName);
  @override
  _AreaSublistState createState() => _AreaSublistState();
}

class _AreaSublistState extends State<AreaSublist> {
  GetAreaModel getareaData;

  String emirateName;

  bool selected = false;

  var lst = new List();
  @override
  void initState() {
    super.initState();

    fetchArea(widget._emirateName).then((areaData) {
      setState(() {
        getareaData = areaData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetAreaModel>(
        future: fetchArea(widget._emirateName),
        builder: (context, AsyncSnapshot<GetAreaModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemCount: getareaData.result.length,
                separatorBuilder: (BuildContext context, int index) =>
                    new Divider(
                      color: Colors.blueGrey,
                      thickness: .5,
                    ),
                itemBuilder: (BuildContext context, int index2) {
                  return Container(
                    width: 200,
                    height: 40,
                    child: ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage(
                                        getareaData.result[index2].id
                                            .toString(),
                                        getareaData.result[index2].area
                                            .toString(),
                                      )));
                        },
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text(getareaData.result[index2].area.toString()),
                        )),
                  );
                });
          } else {
            return Container();
          }
        });
  }
}
