import 'package:flutter_spotify_clone/data/repository/auth/auth_repository_implementation.dart';
import 'package:flutter_spotify_clone/data/repository/song/song_repository_impl.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/domain/repository/song/song.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/get_user.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signin.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signup.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_favorite_songs.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_news_songs.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/get_play_list.dart';
import 'package:flutter_spotify_clone/domain/usecases/song/is_favorite_song.dart';
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

  serviceLocator.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
    AddOrRemoveFavoriteSongUseCase(),
  );

  serviceLocator.registerSingleton<IsFavoriteSongUseCase>(
    IsFavoriteSongUseCase(),
  );

  serviceLocator.registerSingleton<GetUserUseCase>(
    GetUserUseCase(),
  );

  serviceLocator.registerSingleton<GetFavoriteSongsUseCase>(
    GetFavoriteSongsUseCase(),
  );
}
