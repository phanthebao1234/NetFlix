import 'dart:convert';

List<KeywordModel> keywordModelFromJson(String str) => List<KeywordModel>.from(json.decode(str).map((x) => KeywordModel.fromJson(x)));

String keywordModelToJson(List<KeywordModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KeywordModel {
    final String name;
    final int id;

    KeywordModel({
        required this.name,
        required this.id,
    });

    factory KeywordModel.fromJson(Map<String, dynamic> json) => KeywordModel(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
