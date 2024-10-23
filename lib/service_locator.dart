import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/repositories/auth.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/data/movie/repositories/movie.dart';
import 'package:netflix/data/movie/sources/movie_service.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/domain/auth/usecases/is_logged_in.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:netflix/domain/movie/usecases/get_trending.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Service
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiService());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

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
}
