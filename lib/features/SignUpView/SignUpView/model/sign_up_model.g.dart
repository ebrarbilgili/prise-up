// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) {
  return SignUpModel(
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    user: json['user'] as int?,
  );
}

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'user': instance.user,
    };
