import 'package:json_annotation/json_annotation.dart';

part 'register_user_model.g.dart';

@JsonSerializable()
class PostRegisterUserModel {
  String? username;
  String? email;
  String? password;

  PostRegisterUserModel({
    this.username,
    this.email,
    this.password,
  });

  factory PostRegisterUserModel.fromJson(Map<String, dynamic> json) {
    return _$PostRegisterUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostRegisterUserModelToJson(this);
  }
}
