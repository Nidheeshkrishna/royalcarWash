import 'dart:convert';

class SpaceListModel {
    SpaceListModel({
        this.result,
    });

    List<Result> result;

    factory SpaceListModel.fromJson(String str) => SpaceListModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpaceListModel.fromMap(Map<String, dynamic> json) => SpaceListModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
    };
}

class Result {
    Result({
        this.spaceId,
        this.emiratesId,
        this.locationId,
        this.spaceName,
        this.spaceAddress,
        this.spaceLattitude,
        this.spaceLongitude,
        this.spaceSlotCount,
        this.spaceImage,
    });

    int spaceId;
    int emiratesId;
    int locationId;
    String spaceName;
    String spaceAddress;
    double spaceLattitude;
    double spaceLongitude;
    int spaceSlotCount;
    String spaceImage;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        spaceId: json["Space_ID"],
        emiratesId: json["Emirates_ID"],
        locationId: json["Location_ID"],
        spaceName: json["Space_Name"],
        spaceAddress: json["Space_Address"],
        spaceLattitude: json["Space_Lattitude"].toDouble(),
        spaceLongitude: json["Space_Longitude"].toDouble(),
        spaceSlotCount: json["Space_SlotCount"],
        spaceImage: json["spaceImage"],
    );

    Map<String, dynamic> toMap() => {
        "Space_ID": spaceId,
        "Emirates_ID": emiratesId,
        "Location_ID": locationId,
        "Space_Name": spaceName,
        "Space_Address": spaceAddress,
        "Space_Lattitude": spaceLattitude,
        "Space_Longitude": spaceLongitude,
        "Space_SlotCount": spaceSlotCount,
        "spaceImage": spaceImage,
    };
}
