import 'package:flutter_spotify_clone/data/repository/auth/auth_repository_implementation.dart';
import 'package:flutter_spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signin.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signup.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImplementation(),
  );

  serviceLocator.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImplementation(),
  );

  serviceLocator.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );

  serviceLocator.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  serviceLocator.registerSingleton<SignInUseCase>(
    SignInUseCase(),
  );

  serviceLocator.registerSingleton<GetNewSongUseCase>(
    GetNewSongUseCase(),
  );

  serviceLocator.registerSingleton<GetPlaylistUseCase>(
    GetPlaylistUseCase(),
  );
}
