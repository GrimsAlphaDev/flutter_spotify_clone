import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await serviceLocator<SongsRepository>().isFavoriteSong(params!);
  }
}
