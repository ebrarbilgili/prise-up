// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return UserProfileModel(
    id: json['id'] as int?,
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
    linkedIn: json['linkedIn'] as String?,
    twitter: json['twitter'] as String?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
      'linkedIn': instance.linkedIn,
      'twitter': instance.twitter,
      'phone': instance.phone,
    };
