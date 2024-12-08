import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class GetNewSongUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    // Cek apakah sudah teregistrasi
    if (!serviceLocator.isRegistered<SongRepositoryImpl>()) {
      // Lakukan registrasi manual jika diperlukan
      serviceLocator.registerSingleton<SongRepositoryImpl>(
        SongRepositoryImpl(),
      );
    }
    return await serviceLocator<SongRepositoryImpl>().getNewsSong();
  }
}
