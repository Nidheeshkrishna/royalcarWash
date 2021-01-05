import 'dart:convert';

class ResendOtpModel {
    ResendOtpModel({
        this.status,
    });

    String status;

    factory ResendOtpModel.fromJson(String str) => ResendOtpModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResendOtpModel.fromMap(Map<String, dynamic> json) => ResendOtpModel(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}
