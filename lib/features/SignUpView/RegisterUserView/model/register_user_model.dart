import 'package:json_annotation/json_annotation.dart';

part 'register_user_model.g.dart';

@JsonSerializable()
class PostRegisterUserModel {
  String? email;
  String? first_name;
  String? last_name;
  String? university;
  String? faculty;
  String? city;
  String? twitter;
  String? linkedin;
  String? phone;
  String? password;
  String? password2;

  PostRegisterUserModel({
    this.email,
    this.first_name,
    this.last_name,
    this.university,
    this.faculty,
    this.city,
    this.twitter,
    this.linkedin,
    this.phone,
    this.password,
    this.password2,
  });

  factory PostRegisterUserModel.fromJson(Map<String, dynamic> json) {
    return _$PostRegisterUserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostRegisterUserModelToJson(this);
  }
}
