import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:royal_car_wash_customer_app/models/serviceListModel.dart';


Future<ServiceListModel> fetchServices() async {
 http.Response response = await http.get(
      'http://royalcars.ociuz.in/mobileapi/GetServices');
  //List<Tutorials> list;

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    print("responseJson : $responseJson");

    return ServiceListModel.fromMap(responseJson);
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
  // return Tutorial.fromJson(json.decode(response.body));
}