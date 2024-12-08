import 'package:flutter_spotify_clone/domain/entities/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListsLoaded extends PlayListState {
  final List<SongEntity> songs;
  PlayListsLoaded({required this.songs});
}

class PlayListsLoadFailure extends PlayListState {}
