import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_clone/core/usecase/usecase.dart';
import 'package:flutter_spotify_clone/data/models/auth/create_user_req.dart';
import 'package:flutter_spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:flutter_spotify_clone/domain/repository/auth/auth.dart';
import 'package:flutter_spotify_clone/service_locator.dart';

class SignInUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return serviceLocator<AuthRepository>().signin(params!);
  }
}
