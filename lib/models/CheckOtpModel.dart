import 'dart:convert';

class CheckOtpModel {
    CheckOtpModel({
        this.status,
    });

    String status;

    factory CheckOtpModel.fromJson(String str) => CheckOtpModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CheckOtpModel.fromMap(Map<String, dynamic> json) => CheckOtpModel(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}
