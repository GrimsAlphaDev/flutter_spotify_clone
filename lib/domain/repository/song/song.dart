import 'package:dartz/dartz.dart';

abstract class SongsRepository {
  Future<Either> getNewsSong();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
}
