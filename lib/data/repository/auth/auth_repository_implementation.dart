import 'package:flutter_spotify_clone/data/models/auth/create_user_req.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq createUserReq) async {
    await serviceLocator<AuthFirebaseService>().signup(createUserReq);
  }
}
