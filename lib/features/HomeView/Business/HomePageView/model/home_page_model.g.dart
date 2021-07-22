// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessGetProjectModel _$BusinessGetProjectModelFromJson(
    Map<String, dynamic> json) {
  return BusinessGetProjectModel(
    id: json['id'] as int?,
    userProfile: json['userProfile'] == null
        ? null
        : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    desc: json['desc'] as String?,
    university: json['university'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$BusinessGetProjectModelToJson(
        BusinessGetProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userProfile': instance.userProfile,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'university': instance.university,
      'city': instance.city,
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    id: json['id'] as int?,
    last_login: json['last_login'] as String?,
    is_superuser: json['is_superuser'] as bool?,
    date_joined: json['date_joined'] as String?,
    email: json['email'] as String?,
    account_type: json['account_type'] as int?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    is_active: json['is_active'] as bool?,
    is_admin: json['is_admin'] as bool?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
    linkedIn: json['linkedIn'] as String?,
    twitter: json['twitter'] as String?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_login': instance.last_login,
      'is_superuser': instance.is_superuser,
      'date_joined': instance.date_joined,
      'email': instance.email,
      'account_type': instance.account_type,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'is_active': instance.is_active,
      'is_admin': instance.is_admin,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
      'linkedIn': instance.linkedIn,
      'twitter': instance.twitter,
      'phone': instance.phone,
    };
