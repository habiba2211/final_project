import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

class UserModel extends UserEntity{
  UserModel({
      super.userName,
      super.email,
      super.token,});

  UserModel.fromJson(dynamic json) {
    userName = json['userName'];
    email = json['email'];
    token = json['token'];
  }




}