import 'dart:convert';

KKMovieModel movieModelFromJson(String str) =>
    KKMovieModel.fromJson(json.decode(str));

String movieModelToJson(KKMovieModel data) => json.encode(data.toJson());

class KKMovieModel {
  final bool status;
  final String msg;
  final Movie movie;
  final List<Episode> episodes;

  KKMovieModel({
    required this.status,
    required this.msg,
    required this.movie,
    required this.episodes,
  });

  factory KKMovieModel.fromJson(Map<String, dynamic> json) => KKMovieModel(
        status: json["status"],
        msg: json["msg"],
        movie: Movie.fromJson(json["movie"]),
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "movie": movie.toJson(),
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  final String serverName;
  final List<ServerDatum> serverData;

  Episode({
    required this.serverName,
    required this.serverData,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        serverName: json["server_name"],
        serverData: List<ServerDatum>.from(
            json["server_data"].map((x) => ServerDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "server_name": serverName,
        "server_data": List<dynamic>.from(serverData.map((x) => x.toJson())),
      };
}

class ServerDatum {
  final String name;
  final String slug;
  final String filename;
  final String linkEmbed;
  final String linkM3U8;

  ServerDatum({
    required this.name,
    required this.slug,
    required this.filename,
    required this.linkEmbed,
    required this.linkM3U8,
  });

  factory ServerDatum.fromJson(Map<String, dynamic> json) => ServerDatum(
        name: json["name"],
        slug: json["slug"],
        filename: json["filename"],
        linkEmbed: json["link_embed"],
        linkM3U8: json["link_m3u8"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "filename": filename,
        "link_embed": linkEmbed,
        "link_m3u8": linkM3U8,
      };
}

class Movie {
  final Tmdb tmdb;
  final Imdb imdb;
  final Created created;
  final Created modified;
  final String id;
  final String name;
  final String slug;
  final String originName;
  final String content;
  final String type;
  final String status;
  final String posterUrl;
  final String thumbUrl;
  final bool isCopyright;
  final bool subDocquyen;
  final bool chieurap;
  final String trailerUrl;
  final String time;
  final String episodeCurrent;
  final String episodeTotal;
  final String quality;
  final String lang;
  final String notify;
  final String showtimes;
  final int year;
  final int view;
  final List<String> actor;
  final List<String> director;
  final List<Category> category;
  final List<Category> country;

  Movie({
    required this.tmdb,
    required this.imdb,
    required this.created,
    required this.modified,
    required this.id,
    required this.name,
    required this.slug,
    required this.originName,
    required this.content,
    required this.type,
    required this.status,
    required this.posterUrl,
    required this.thumbUrl,
    required this.isCopyright,
    required this.subDocquyen,
    required this.chieurap,
    required this.trailerUrl,
    required this.time,
    required this.episodeCurrent,
    required this.episodeTotal,
    required this.quality,
    required this.lang,
    required this.notify,
    required this.showtimes,
    required this.year,
    required this.view,
    required this.actor,
    required this.director,
    required this.category,
    required this.country,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        tmdb: Tmdb.fromJson(json["tmdb"]),
        imdb: Imdb.fromJson(json["imdb"]),
        created: Created.fromJson(json["created"]),
        modified: Created.fromJson(json["modified"]),
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        originName: json["origin_name"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        posterUrl: json["poster_url"],
        thumbUrl: json["thumb_url"],
        isCopyright: json["is_copyright"],
        subDocquyen: json["sub_docquyen"],
        chieurap: json["chieurap"],
        trailerUrl: json["trailer_url"],
        time: json["time"],
        episodeCurrent: json["episode_current"],
        episodeTotal: json["episode_total"],
        quality: json["quality"],
        lang: json["lang"],
        notify: json["notify"],
        showtimes: json["showtimes"],
        year: json["year"],
        view: json["view"],
        actor: List<String>.from(json["actor"].map((x) => x)),
        director: List<String>.from(json["director"].map((x) => x)),
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        country: List<Category>.from(
            json["country"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tmdb": tmdb.toJson(),
        "imdb": imdb.toJson(),
        "created": created.toJson(),
        "modified": modified.toJson(),
        "_id": id,
        "name": name,
        "slug": slug,
        "origin_name": originName,
        "content": content,
        "type": type,
        "status": status,
        "poster_url": posterUrl,
        "thumb_url": thumbUrl,
        "is_copyright": isCopyright,
        "sub_docquyen": subDocquyen,
        "chieurap": chieurap,
        "trailer_url": trailerUrl,
        "time": time,
        "episode_current": episodeCurrent,
        "episode_total": episodeTotal,
        "quality": quality,
        "lang": lang,
        "notify": notify,
        "showtimes": showtimes,
        "year": year,
        "view": view,
        "actor": List<dynamic>.from(actor.map((x) => x)),
        "director": List<dynamic>.from(director.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "country": List<dynamic>.from(country.map((x) => x.toJson())),
      };
}

class Category {
  final String id;
  final String name;
  final String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Created {
  final DateTime time;

  Created({
    required this.time,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
      };
}

class Imdb {
  final dynamic id;

  Imdb({
    required this.id,
  });

  factory Imdb.fromJson(Map<String, dynamic> json) => Imdb(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Tmdb {
  final dynamic type;
  final dynamic id;
  final dynamic season;
  final int voteAverage;
  final int voteCount;

  Tmdb({
    required this.type,
    required this.id,
    required this.season,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
        type: json["type"],
        id: json["id"],
        season: json["season"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "season": season,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
