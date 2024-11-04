import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/core/network/dio_client_kkphim.dart';
import 'package:netflix/data/auth/repositories/auth.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/data/kkphim_movie/repositories/feature_movie.dart';
import 'package:netflix/data/kkphim_movie/sources/kkmovie_service.dart';
import 'package:netflix/data/movie/repositories/movie.dart';
import 'package:netflix/data/movie/sources/movie_service.dart';
import 'package:netflix/data/tv/repositories/tv.dart';
import 'package:netflix/data/tv/sources/tv_service.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix/domain/movie/usecases/get_recommend_movie.dart';
import 'package:netflix/domain/movie/usecases/get_similar_movies.dart';
import 'package:netflix/domain/movie/usecases/get_trending.dart';
import 'package:netflix/domain/movie/usecases/get_tv_trailer.dart';
import 'package:netflix/domain/movie_kkphim/repositories/kkmovie.dart';
import 'package:netflix/domain/movie_kkphim/usecases/getFeatureMovies.dart';
import 'package:netflix/domain/tv/repositories/tv.dart';
import 'package:netflix/domain/tv/usecases/get_keyword_tv.dart';
import 'package:netflix/domain/tv/usecases/get_popular_tv.dart';
import 'package:netflix/domain/tv/usecases/get_recommend_tv.dart';
import 'package:netflix/domain/tv/usecases/get_similar_tv.dart';
import 'package:netflix/domain/tv/usecases/search_tv.dart';
import 'package:netflix/domain/movie/usecases/search_movie.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<DioClientKKPhim>(DioClientKKPhim());

  // Service
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiService());
  sl.registerSingleton<KKMovieService>(KKMovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<KKMovieRepository>(FeatureMovieRepositoryImpl());
  sl.registerSingleton<TVRepositories>(TvRepositoriesImpl());

  // Usecases

  // Auth Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  // --------------------------------

  // Movie Usecases
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase());
  sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());

  // KKMovie UseCase
  sl.registerSingleton<GetFeatureMoviesUseCase>(GetFeatureMoviesUseCase());

  // TV UseCase
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());

  // Trailer UseCase
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetTvTrailerUseCase>(GetTvTrailerUseCase());

  sl.registerSingleton<GetRecommendMovieUseCase>(GetRecommendMovieUseCase());

  sl.registerSingleton<GetSimilarMovieUseCase>(GetSimilarMovieUseCase());

  // TV Usecase
  sl.registerSingleton<GetRecommendTVUseCase>(GetRecommendTVUseCase());
  sl.registerSingleton<GetSimilarTVUseCase>(GetSimilarTVUseCase());
  sl.registerSingleton<GetKeywordTVsUseCase>(GetKeywordTVsUseCase());
  sl.registerSingleton<SearchTvUseCase>(SearchTvUseCase());
}
