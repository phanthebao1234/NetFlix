class ApiUrl {
  static const baseURL = 'http://192.168.1.13:4545/';
  static const baseURLKKPhim = 'https://phimapi.com';
  static const featureMovie = '$baseURLKKPhim/v1/api/danh-sach/phim-le';
  static const apiV = 'api/v1/';

  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';

  static const trailerBase = 'https://www.youtube.com/watch?v=';
}
