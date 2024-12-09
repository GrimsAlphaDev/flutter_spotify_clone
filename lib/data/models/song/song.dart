import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
  });

  SongModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        artist = json['artist'],
        duration = json['duration'],
        releaseDate = json['releaseDate'],
        isFavorite = json['isFavorite'],
        songId = json['songId'];
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      isFavorite: isFavorite!,
      songId: songId!,
    );
  }
}