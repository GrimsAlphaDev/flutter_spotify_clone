import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_favorite_songs.dart';
import 'package:flutter_spotify_clone/presentation/profile/bloc/favorite_songs_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await serviceLocator<GetFavoriteSongsUseCase>().call();

    result.fold(
      (ifLeft) {
        emit(FavoriteSongsFailure());
      },
      (ifRight) {
        favoriteSongs = ifRight;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
