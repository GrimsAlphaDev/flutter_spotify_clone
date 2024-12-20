import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/data/models/auth/create_user_req.dart';
import 'package:flutter_spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:flutter_spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await serviceLocator<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await serviceLocator<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await serviceLocator<AuthFirebaseService>().getUser();
  }
}
