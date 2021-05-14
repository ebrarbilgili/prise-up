// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationsModel _$ApplicationsModelFromJson(Map<String, dynamic> json) {
  return ApplicationsModel(
    id: json['id'] as int?,
    project: json['project'] == null
        ? null
        : Project.fromJson(json['project'] as Map<String, dynamic>),
    userProfile: json['userProfile'] as int?,
  );
}

Map<String, dynamic> _$ApplicationsModelToJson(ApplicationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project': instance.project,
      'userProfile': instance.userProfile,
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
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    university: json['university'] as String?,
    faculty: json['faculty'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'university': instance.university,
      'faculty': instance.faculty,
      'city': instance.city,
    };
