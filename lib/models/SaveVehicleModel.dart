
import 'dart:convert';

SaveVehicleModel saveVehicleModelFromMap(String str) => SaveVehicleModel.fromMap(json.decode(str));

String saveVehicleModelToMap(SaveVehicleModel data) => json.encode(data.toMap());

class SaveVehicleModel {
    SaveVehicleModel({
        this.status,
    });

    bool status;

    factory SaveVehicleModel.fromMap(Map<String, dynamic> json) => SaveVehicleModel(
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
    };
}
