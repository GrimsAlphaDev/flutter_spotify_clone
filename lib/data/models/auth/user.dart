import 'package:flutter_spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullname;
  String? email;
  String? imageURL;

  UserModel({
    this.fullname,
    this.email,
    this.imageURL,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fullname = json['name'];
    email = json['email'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullname: fullname,
      email: email,
    );
  }
}
