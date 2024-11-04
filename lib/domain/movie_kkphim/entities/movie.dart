class KKMovieEntity {
  final bool status;
  final String msg;
  final MovieDetail movie;
  final List<EpisodeEntity> episodes;

  KKMovieEntity({
    required this.status,
    required this.msg,
    required this.movie,
    required this.episodes,
  });
}

class EpisodeEntity {
  final String serverName;
  final List<ServerDatumEntity> serverData;

  EpisodeEntity({
    required this.serverName,
    required this.serverData,
  });
}

class ServerDatumEntity {
  final String name;
  final String slug;
  final String filename;
  final String linkEmbed;
  final String linkM3U8;

  ServerDatumEntity({
    required this.name,
    required this.slug,
    required this.filename,
    required this.linkEmbed,
    required this.linkM3U8,
  });
}

class MovieDetail {
  final TmdbEntity tmdb;
  final ImdbEntity imdb;
  final DateTime created;
  final DateTime modified;
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
  final List<CategoryEntity> category;
  final List<CategoryEntity> country;

  MovieDetail({
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
}

class CategoryEntity {
  final String id;
  final String name;
  final String slug;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
  });
}

class TmdbEntity {
  final dynamic type;
  final dynamic id;
  final dynamic season;
  final int voteAverage;
  final int voteCount;

  TmdbEntity({
    required this.type,
    required this.id,
    required this.season,
    required this.voteAverage,
    required this.voteCount,
  });
}

class ImdbEntity {
  final dynamic id;

  ImdbEntity({
    required this.id,
  });
}
