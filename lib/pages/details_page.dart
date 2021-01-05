import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:royal_car_wash_customer_app/pages/main_home_page.dart';

import 'package:royal_car_wash_customer_app/pages/payment_page.dart';
import 'package:royal_car_wash_customer_app/widgets/Avilable_slots_widgets.dart';

// ignore: camel_case_types
class details_page extends StatefulWidget {
  @override
  _details_pageState createState() => _details_pageState();
}

// ignore: camel_case_types
class _details_pageState extends State<details_page> {
  TextEditingController _date = new TextEditingController();
  TextEditingController todateControler = new TextEditingController();
  TextEditingController dateNormalControler = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateTime selectedDateto = DateTime.now();
  DateTime selectedDateNormal = DateTime.now();

  int _radioValue;
  // ignore: non_constant_identifier_names
  bool txt_visibility;
  // ignore: non_constant_identifier_names
  bool txt_visibility_from;
  // ignore: non_constant_identifier_names
  bool day_dropdown;

  void initState() {
    _radioValue = 0;
    txt_visibility = false;
    txt_visibility_from = false;
    day_dropdown = false;
    super.initState();
  }

  String selectedUser;
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
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainHomePage()));
        },
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Service Details ",
        style: TextStyle(color: Color.fromRGBO(45, 97, 135, 1), fontSize: 16),
      ),
    );
    double contentHeight =
        MediaQuery.of(context).size.height - appbar.preferredSize.height;
    double contentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar,
      body: Container(
          width: contentWidth,
          height: contentHeight,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(dummyData[1]['image_url'],
                          width: 80, height: 100),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: Text(
                                dummyData[1]['Company_name'],
                                style: TextStyle(
                                    color: Color.fromRGBO(46, 79, 101, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        Container(
                            width: 280,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 10),
                              child: Text(
                                dummyData[1]['address'],
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color.fromRGBO(46, 79, 101, 1),
                                    fontSize: 13),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Dodge Challenger",
                          style: TextStyle(
                              color: Color.fromRGBO(46, 79, 101, 1),
                              fontSize: 13)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text("40 Aed",
                          style: TextStyle(
                              color: Color.fromRGBO(46, 79, 101, 1),
                              fontSize: 14)),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 10),
                      child: Text("Description",
                          style: TextStyle(color: Colors.black, fontSize: 13)),
                    ),
                  ],
                ),
                Container(
                  height: contentHeight * .20,
                  child: ListView.builder(
                      itemCount: description.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 12.0,
                              ),
                              Text(
                                description[index],
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: contentWidth,
                    height: 50,
                    child: Card(
                        elevation: 10,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text('Category:',
                                  style: TextStyle(
                                      color: Color.fromRGBO(46, 79, 101, 1),
                                      fontSize: 13)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70.0),
                              child: Radio(
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                              ),
                            ),
                            new Text('Normal'),
                            Radio(
                              value: 1,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text('Contract'),
                          ],
                        )),
                  ),
                ),
                SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Visibility(
                                    visible: txt_visibility_from,
                                    child: Container(
                                      width: 180,
                                      height: 40,
                                      child: Card(
                                        elevation: 8,
                                        child: TextFormField(
                                          controller: _date,
                                          style: TextStyle(color: Colors.black),
                                          onTap: () {
                                            _selectDate();
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'From Date:',
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 97, 135, 2),
                                                fontSize: 15),
                                            suffixIcon: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.0),
                                              child: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromRGBO(
                                                    45, 97, 135, 2),
                                                size: 15.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      45, 97, 135, 1)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 10),
                                  child: Container(
                                    width: 170,
                                    height: 50,
                                    child: Card(
                                      elevation: 8,
                                      child: Center(
                                        child: TextFormField(
                                          controller: dateNormalControler,
                                          onTap: () {
                                            _selectDateNormal();
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Date:',
                                            hintStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    45, 97, 135, 2),
                                                fontSize: 15),
                                            suffixIcon: Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 8,
                                              ),
                                              child: const Icon(
                                                Icons.calendar_today,
                                                color: Color.fromRGBO(
                                                    45, 97, 135, 2),
                                                size: 15.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      45, 97, 135, 1)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10),
                                  child: Visibility(
                                    visible: txt_visibility,
                                    child: Container(
                                      width: 180,
                                      height: 50,
                                      child: Card(
                                        elevation: 8,
                                        child: Center(
                                          child: TextFormField(
                                            controller: todateControler,
                                            onTap: () {
                                              _selectDateTo();
                                            },
                                            decoration: const InputDecoration(
                                              hintText: 'To Date:',
                                              alignLabelWithHint: true,
                                              hintStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      45, 97, 135, 2),
                                                  fontSize: 15),
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: const Icon(
                                                  Icons.calendar_today,
                                                  color: Color.fromRGBO(
                                                      45, 97, 135, 2),
                                                  size: 15.0,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        45, 97, 135, 1)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: day_dropdown,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "select Day:",
                            style: TextStyle(
                                color: Color.fromRGBO(45, 97, 135, 2),
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          width: 130,
                          height: 40,
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                items: <String>[
                                  'Sunday',
                                  'Monady',
                                  'Tuesday',
                                  'Wednesday',
                                  'Thursday',
                                  'Friday',
                                  'Saturday'
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(
                                      value,
                                      style: TextStyle(
                                          color: Color.fromRGBO(45, 97, 135, 2),
                                          fontSize: 13),
                                    ),
                                  );
                                }).toList(),
                                value: selectedUser,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    selectedUser = value;
                                  });
                                },
                                hint: Text("Week Day"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Avilable Slots",
                        style: TextStyle(
                            color: Color.fromRGBO(45, 97, 135, 2),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Column(
                  children: <Widget>[
                    Container(
                        width: contentWidth * .70,
                        height: contentHeight * .30,
                        child: Avilable_slots_widgets()),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Container(
                        width: 180,
                        height: 35,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentPage()));
                          },
                          color: Color.fromRGBO(46, 79, 101, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                color: Color.fromRGBO(46, 79, 101, 1),
                              )),
                          child: Text(
                            "CONTINUE(40 Aed)",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  final List<Map<String, Object>> dummyData = [
    {
      'id': '1',
      'Company_name': 'AL-NASER CAR WASH CENTER',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/carwash1.jpg',
    },
    {
      'id': '2',
      'Company_name': 'NASEER CAR CLINIC',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/carwash2.jpg',
    },
    {
      'id': '3',
      'Company_name': 'AL-BARAKA CAR BATH',
      'address':
          '21447-Sheikh Mohammed Bin Rashid Blvd Downtown Dubai-United Arab Emirates',
      'image_url': 'assets/images/NoPath.png'
    }
  ];
  List<String> description = [
    'Full Car Body wash',
    'Interior Vacuum,Dust,Wiping & Cleaning',
    'Light Interior Shining With Special Products',
    'Tires And Wheels Wash And Shine',
    'Ac vents Cleaning Tissue  Pack Perfuming Fragrance'
  ];
  //double _result = 0.0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          //_result = ...
          setState(() {
            txt_visibility = false;
            txt_visibility_from = false;
            day_dropdown = false;
          });

          break;
        case 1:
          setState(() {
            txt_visibility = true;
            txt_visibility_from = true;
            day_dropdown = true;
          });

          break;
        case 2:
          // _result = ...
          break;
      }
    });
  }

  _selectDate() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (date != null && date != selectedDate)
      setState(() {
        selectedDate = date;
        _date.text = DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(selectedDate.toString()));
      });
  }

  _selectDateTo() async {
    final date1 = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (date1 != null && date1 != selectedDate)
      setState(() {
        selectedDateto = date1;
        todateControler.text = DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(selectedDateto.toString()));
      });
  }

  _selectDateNormal() async {
    final dateNormal = await showDatePicker(
        context: context,
        firstDate: DateTime(1970),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (dateNormal != null && dateNormal != selectedDate)
      setState(() {
        selectedDateNormal = dateNormal;
        dateNormalControler.text = DateFormat("dd/MM/yyyy")
            .format(DateTime.parse(selectedDateNormal.toString()));
      });
  }
}
