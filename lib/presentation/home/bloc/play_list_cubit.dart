import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:flutter_spotify_clone/presentation/home/bloc/play_list_state.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayLists() async {
    var returnedSongs = await serviceLocator<GetPlaylistUseCase>().call();

    returnedSongs.fold(
      (ifLeft) {
        emit(PlayListsLoadFailure());
      },
      (data) {
        emit(
          PlayListsLoaded(songs: data),
        );
      },
    );
  }
}
