import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/entity/trailer_entity.dart';
import 'package:netflix/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix/presentation/watch/bloc/trailer_state.dart';
import 'package:netflix/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerMovieLoading());

  Future<void> getTrailerMovie(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);

    returnedData.fold(
      (error) {
        emit(FailureLoadTrailerMovie(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
          ),
        );
        emit(TrailerMovieLoaded(youtubePlayerController: controller));
      },
    );
  }
}
