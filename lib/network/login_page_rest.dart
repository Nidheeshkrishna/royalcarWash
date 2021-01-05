import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:royal_car_wash_customer_app/models/LoginModel.dart';


Future<LoginModel> loginCustomer(
     String username, String password) async {
  final http.Response response = await http.post(
    'http://royalcars.ociuz.in/mobileapi/Login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
  var responseJson = json.decode(response.body);
    print("responseJson : $responseJson");
    return LoginModel.fromMap(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load login Api');
  }
}
