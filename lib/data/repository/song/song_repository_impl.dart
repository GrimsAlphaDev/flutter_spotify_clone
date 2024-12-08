import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSong() async {
    return serviceLocator<SongFirebaseService>().getNewsSong();
  }

  @override
  Future<Either> getPlayList() async {
    return serviceLocator<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) {
    return serviceLocator<SongFirebaseService>()
        .addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) {
    return serviceLocator<SongFirebaseService>().isFavoritesSong(songId);
  }
}
