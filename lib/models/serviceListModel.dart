import 'dart:convert';

ServiceListModel serviceListModelFromMap(String str) => ServiceListModel.fromMap(json.decode(str));

String serviceListModelToMap(ServiceListModel data) => json.encode(data.toMap());

class ServiceListModel {
    ServiceListModel({
        this.result,
    });

    List<Result> result;

    factory ServiceListModel.fromMap(Map<String, dynamic> json) => ServiceListModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        this.serviceId,
        this.serviceName,
        this.serviceDetails,
        this.serviceDuration,
        this.serviceRatePerHour,
        this.serviceIconpath,
    });

    int serviceId;
    String serviceName;
    String serviceDetails;
    Map<String, double> serviceDuration;
    double serviceRatePerHour;
    String serviceIconpath;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        serviceId: json["Service_ID"],
        serviceName: json["Service_Name"],
        serviceDetails: json["Service_Details"],
        serviceDuration: Map.from(json["Service_Duration"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        serviceRatePerHour: json["Service_RatePerHour"],
        serviceIconpath: json["Service_Iconpath"],
    );

    Map<String, dynamic> toMap() => {
        "Service_ID": serviceId,
        "Service_Name": serviceName,
        "Service_Details": serviceDetails,
        "Service_Duration": Map.from(serviceDuration).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Service_RatePerHour": serviceRatePerHour,
        "Service_Iconpath": serviceIconpath,
    };
}
