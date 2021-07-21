// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProjectModel _$CreateProjectModelFromJson(Map<String, dynamic> json) {
  return CreateProjectModel(
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    desc: json['desc'] as String?,
    university: json['university'] as String?,
    city: json['city'] as String?,
    userProfile: json['userProfile'] as int?,
  );
}

Map<String, dynamic> _$CreateProjectModelToJson(CreateProjectModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'university': instance.university,
      'city': instance.city,
      'userProfile': instance.userProfile,
    };
