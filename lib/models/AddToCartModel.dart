
import 'dart:convert';

AddToCartModel addToCartModelFromMap(String str) => AddToCartModel.fromMap(json.decode(str));

String addToCartModelToMap(AddToCartModel data) => json.encode(data.toMap());

class AddToCartModel {
    AddToCartModel({
        this.status,
    });

    bool status;

    factory AddToCartModel.fromMap(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}
