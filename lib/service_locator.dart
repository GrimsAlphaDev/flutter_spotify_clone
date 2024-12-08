import 'package:flutter_spotify_clone/data/repository/auth/auth_repository_implementation.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImplementation(),
  );

  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImplementation(),
  );

  serviceLocator.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  
}
