import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/entity/trailer_entity.dart';
import 'package:netflix/domain/movie/usecases/get_tv_trailer.dart';
import 'package:netflix/presentation/watch/bloc/tv_trailer_state.dart';


import 'package:netflix/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TVTrailerCubit extends Cubit<TVTrailerState> {
  TVTrailerCubit() : super(TVTrailerLoading());

  void getTVTrailer(int tvId) async {
    var returnedData = await sl<GetTvTrailerUseCase>().call(params: tvId);
    returnedData.fold((error) {
      emit(FailureLoadTVTrailer(errorMessage: error));
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      emit(TVTrailerLoaded(youtubePlayerController: controller));
    });
  }
}
