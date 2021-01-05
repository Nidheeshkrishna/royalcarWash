import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:royal_car_wash_customer_app/models/getVehicleModel.dart';


Future<GetVehicleModel> fetchVehicle(
    String customerID) async {
  final http.Response response = await http.post(
    'http://royalcars.ociuz.in/mobileapi/getVehicles',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'CustomerID': customerID,
    
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  var responseJson = json.decode(response.body);
    print("responseJson : $responseJson");
    return GetVehicleModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load get vehicle api');
  }
}
