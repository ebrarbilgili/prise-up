import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  int? id;
  String? username;
  String? token;

  LoginModel({this.id, this.username, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}

@JsonSerializable()
class PostLoginModel {
  String? email;
  String? password;

  PostLoginModel({this.email, this.password});

  factory PostLoginModel.fromJson(Map<String, dynamic> json) {
    return _$PostLoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostLoginModelToJson(this);
  }
}
