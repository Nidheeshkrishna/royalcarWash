import 'dart:convert';

EmiratesModel emiratesModelFromMap(String str) => EmiratesModel.fromMap(json.decode(str));

String emiratesModelToMap(EmiratesModel data) => json.encode(data.toMap());

class EmiratesModel {
    EmiratesModel({
        this.result,
    });

    List<Result> result;

    factory EmiratesModel.fromMap(Map<String, dynamic> json) => EmiratesModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        this.id,
        this.emirates,
    });

    int id;
    String emirates;

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["ID"],
        emirates: json["Emirates"],
    );

    Map<String, dynamic> toMap() => {
        "ID": id,
        "Emirates": emirates,
    };
}
