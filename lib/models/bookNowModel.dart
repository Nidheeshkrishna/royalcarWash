
import 'dart:convert';

BookNowModel bookNowModelFromMap(String str) => BookNowModel.fromMap(json.decode(str));

String bookNowModelToMap(BookNowModel data) => json.encode(data.toMap());

class BookNowModel {
    BookNowModel({
        this.result,
    });

    List<dynamic> result;

    factory BookNowModel.fromMap(Map<String, dynamic> json) => BookNowModel(
        result: List<dynamic>.from(json["result"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x)),
    };
}
