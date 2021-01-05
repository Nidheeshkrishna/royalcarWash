import 'dart:convert';

GetVehicleModel getVehicleModelFromMap(String str) => GetVehicleModel.fromMap(json.decode(str));

String getVehicleModelToMap(GetVehicleModel data) => json.encode(data.toMap());

class GetVehicleModel {
    GetVehicleModel({
        this.result,
    });

    List<Result> result;

    factory GetVehicleModel.fromMap(Map<String, dynamic> json) => GetVehicleModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        this.vehicleId,
        this.customerId,
        this.vehicleName,
        this.vehiclePlateNo,
    });

    int vehicleId;
    int customerId;
    String vehicleName;
    String vehiclePlateNo;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        vehicleId: json["Vehicle_ID"],
        customerId: json["Customer_ID"],
        vehicleName: json["Vehicle_Name"],
        vehiclePlateNo: json["Vehicle_PlateNo"],
    );

    Map<String, dynamic> toMap() => {
        "Vehicle_ID": vehicleId,
        "Customer_ID": customerId,
        "Vehicle_Name": vehicleName,
        "Vehicle_PlateNo": vehiclePlateNo,
    };
}

