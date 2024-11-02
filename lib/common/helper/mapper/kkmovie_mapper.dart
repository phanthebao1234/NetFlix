import 'package:netflix/data/kkphim_movie/models/movie_model.dart';
import 'package:netflix/domain/movie_kkphim/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(KKMovieModel model) {
    return MovieEntity(
      status: model.status,
      msg: model.msg,
      movie: toMovieDetailEntity(model.movie),
      episodes:
          model.episodes.map((episode) => toEpisodeEntity(episode)).toList(),
    );
  }

  static MovieDetail toMovieDetailEntity(Movie movie) {
    return MovieDetail(
      tmdb: toTmdbEntity(movie.tmdb),
      imdb: toImdbEntity(movie.imdb),
      created: movie.created.time,
      modified: movie.modified.time,
      id: movie.id,
      name: movie.name,
      slug: movie.slug,
      originName: movie.originName,
      content: movie.content,
      type: movie.type,
      status: movie.status,
      posterUrl: movie.posterUrl,
      thumbUrl: movie.thumbUrl,
      isCopyright: movie.isCopyright,
      subDocquyen: movie.subDocquyen,
      chieurap: movie.chieurap,
      trailerUrl: movie.trailerUrl,
      time: movie.time,
      episodeCurrent: movie.episodeCurrent,
      episodeTotal: movie.episodeTotal,
      quality: movie.quality,
      lang: movie.lang,
      notify: movie.notify,
      showtimes: movie.showtimes,
      year: movie.year,
      view: movie.view,
      actor: movie.actor,
      director: movie.director,
      category: movie.category.map((cat) => toCategoryEntity(cat)).toList(),
      country:
          movie.country.map((country) => toCategoryEntity(country)).toList(),
    );
  }

  static EpisodeEntity toEpisodeEntity(Episode episode) {
    return EpisodeEntity(
      serverName: episode.serverName,
      serverData:
          episode.serverData.map((data) => toServerDatumEntity(data)).toList(),
    );
  }

  static ServerDatumEntity toServerDatumEntity(ServerDatum data) {
    return ServerDatumEntity(
      name: data.name,
      slug: data.slug,
      filename: data.filename,
      linkEmbed: data.linkEmbed,
      linkM3U8: data.linkM3U8,
    );
  }

  static CategoryEntity toCategoryEntity(Category category) {
    return CategoryEntity(
      id: category.id,
      name: category.name,
      slug: category.slug,
    );
  }

  static TmdbEntity toTmdbEntity(Tmdb tmdb) {
    return TmdbEntity(
      type: tmdb.type,
      id: tmdb.id,
      season: tmdb.season,
      voteAverage: tmdb.voteAverage,
      voteCount: tmdb.voteCount,
    );
  }

  static ImdbEntity toImdbEntity(Imdb imdb) {
    return ImdbEntity(
      id: imdb.id,
    );
  }
}
