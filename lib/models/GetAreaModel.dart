import 'dart:convert';

class GetAreaModel {
    GetAreaModel({
        this.result,
    });

    List<Result> result;

    factory GetAreaModel.fromJson(String str) => GetAreaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetAreaModel.fromMap(Map<String, dynamic> json) => GetAreaModel(
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
        this.area,
    });

    int id;
    String emirates;
    String area;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["ID"],
        emirates:json["Emirates"],
        area: json["Area"],
    );

    Map<String, dynamic> toMap() => {
        "ID": id,
        "Emirates": emirates,
        "Area": area,
    };
}