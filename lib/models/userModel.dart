import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? email;
  final String? name;
  final String? id;
  final PictureModel? pictureModel;

  UserModel({this.email, this.id, this.name, this.pictureModel});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'] as String?,
      name: json['name'],
      pictureModel: PictureModel.fromJson(json['picture']['data']),
    );
  }
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;

  PictureModel({this.height, this.url, this.width});

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }
}
