import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    var result = await serviceLocator<AddOrRemoveFavoriteSongUseCase>()
        .call(params: songId);

    result.fold(
      (ifLeft) {},
      (ifRight) {
        emit(
          FavoriteButtonUpdated(
            isFavorite: ifRight,
          ),
        );
      },
    );
  }
}
