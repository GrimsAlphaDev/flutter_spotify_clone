import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<SongsRepository>()
        .addOrRemoveFavoriteSong(params!);
  }
}
