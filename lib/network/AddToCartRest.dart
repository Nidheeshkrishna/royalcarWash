import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_car_wash_customer_app/models/AddToCartModel.dart';



// ignore: non_constant_identifier_names
Future<AddToCartModel> AddToCartService(
     String userID, String serviceID, String amount) async {
  final http.Response response = await http.post(
    'http://royalcars.ociuz.in/mobileapi/addtocart',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      
      'UserID': userID,
      'ServiceID': serviceID,
      'Amount': amount,

    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  var responseJson = json.decode(response.body);
    print("responseJson : $responseJson");
    return AddToCartModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load login Api');
  }
}
