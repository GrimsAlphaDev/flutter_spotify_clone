import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/models/song/song.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSong();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either> getNewsSong() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
