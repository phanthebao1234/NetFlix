
import 'dart:convert';

NewMovie newMovieFromJson(String str) => NewMovie.fromJson(json.decode(str));

String newMovieToJson(NewMovie data) => json.encode(data.toJson());

class NewMovie {
    final Modified modified;
    final String id;
    final String name;
    final String slug;
    final String originName;
    final String posterUrl;
    final String thumbUrl;
    final int year;

    NewMovie({
        required this.modified,
        required this.id,
        required this.name,
        required this.slug,
        required this.originName,
        required this.posterUrl,
        required this.thumbUrl,
        required this.year,
    });

    factory NewMovie.fromJson(Map<String, dynamic> json) => NewMovie(
        modified: Modified.fromJson(json["modified"]),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        originName: json["origin_name"],
        posterUrl: json["poster_url"],
        thumbUrl: json["thumb_url"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "modified": modified.toJson(),
        "_id": id,
        "name": name,
        "slug": slug,
        "origin_name": originName,
        "poster_url": posterUrl,
        "thumb_url": thumbUrl,
        "year": year,
    };
}

class Modified {
    final DateTime time;

    Modified({
        required this.time,
    });

    factory Modified.fromJson(Map<String, dynamic> json) => Modified(
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
    };
}
