import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/entity/trailer_entity.dart';
import 'package:netflix/domain/movie/usecases/get_movie_trailer.dart';
import 'package:netflix/presentation/watch/bloc/trailer_state.dart';
import 'package:netflix/service_locator.dart';
import 'package:video_player/video_player.dart';

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
        VideoPlayerController videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(ApiUrl.trailerBase + trailerEntity.key));
        await videoPlayerController.initialize();
        final chewieController = ChewieController(videoPlayerController: videoPlayerController, autoPlay: true, looping: false,);
        emit(TrailerMovieLoaded(chewieController: chewieController));
      },
    );
  }
}
