import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/news_song_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class NewsSongCubit extends Cubit<NewsSongState> {
  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await serviceLocator<GetNewSongUseCase>().call();

    returnedSongs.fold(
      (ifLeft) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(
          NewsSongsLoaded(songs: data),
        );
      },
    );
  }
}
