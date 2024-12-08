import 'package:flutter_spotify_clone/domain/entities/song/song.dart';

abstract class NewsSongState {}

class NewsSongLoading extends NewsSongState {}

class NewsSongsLoaded extends NewsSongState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongState {}
