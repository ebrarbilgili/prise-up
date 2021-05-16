// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRegisterUserModel _$PostRegisterUserModelFromJson(
    Map<String, dynamic> json) {
  return PostRegisterUserModel(
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
    twitter: json['twitter'] as String?,
    linkedin: json['linkedin'] as String?,
    phone: json['phone'] as String?,
    password: json['password'] as String?,
    password2: json['password2'] as String?,
  );
}

Map<String, dynamic> _$PostRegisterUserModelToJson(
        PostRegisterUserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
      'twitter': instance.twitter,
      'linkedin': instance.linkedin,
      'phone': instance.phone,
      'password': instance.password,
      'password2': instance.password2,
    };
