import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_clone/presentation/song_player/bloc/song_player_state.dart';
import 'package:just_audio/just_audio.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });
  }

  void updateSongPlayer() {
    emit(
      SongPlayerLoaded(),
    );
  }

  Future<void> loadSong(String assetPath) async {
    try {
      await audioPlayer.setAsset(assetPath);
      print('Song loaded, asset: ' + assetPath);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(
      SongPlayerLoaded(),
    );
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
