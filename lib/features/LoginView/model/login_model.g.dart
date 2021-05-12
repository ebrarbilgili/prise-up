// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    id: json['id'] as int?,
    username: json['username'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'token': instance.token,
    };

PostLoginModel _$PostLoginModelFromJson(Map<String, dynamic> json) {
  return PostLoginModel(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$PostLoginModelToJson(PostLoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
