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
    city: json['city'] as String?,
    twitter: json['twitter'] as String?,
    linkedIn: json['linkedIn'] as String?,
    phone: json['phone'] as String?,
    user: json['user'] as int?,
  );
}

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
      'twitter': instance.twitter,
      'linkedIn': instance.linkedIn,
      'phone': instance.phone,
      'user': instance.user,
    };
