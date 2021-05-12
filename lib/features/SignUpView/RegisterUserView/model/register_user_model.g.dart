// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRegisterUserModel _$PostRegisterUserModelFromJson(
    Map<String, dynamic> json) {
  return PostRegisterUserModel(
    username: json['username'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$PostRegisterUserModelToJson(
        PostRegisterUserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };
