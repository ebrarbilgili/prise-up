// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedModel _$AppliedModelFromJson(Map<String, dynamic> json) {
  return AppliedModel(
    id: json['id'] as int?,
    applyUserProfile: json['applyUserProfile'] == null
        ? null
        : ApplyUserProfile.fromJson(
            json['applyUserProfile'] as Map<String, dynamic>),
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppliedModelToJson(AppliedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applyUserProfile': instance.applyUserProfile,
      'project': instance.project,
    };

ApplyUserProfile _$ApplyUserProfileFromJson(Map<String, dynamic> json) {
  return ApplyUserProfile(
    id: json['id'] as int?,
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$ApplyUserProfileToJson(ApplyUserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
    };

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
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

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
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
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
    twitter: json['twitter'] as String?,
    linkedIn: json['linkedIn'] as String?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
      'twitter': instance.twitter,
      'linkedIn': instance.linkedIn,
      'phone': instance.phone,
    };
