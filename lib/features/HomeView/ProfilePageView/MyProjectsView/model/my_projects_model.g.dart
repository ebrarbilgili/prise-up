// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_projects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyProjectsModel _$MyProjectsModelFromJson(Map<String, dynamic> json) {
  return MyProjectsModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    desc: json['desc'] as String?,
    university: json['university'] as String?,
    city: json['city'] as String?,
    userProfile: json['userProfile'],
  );
}

Map<String, dynamic> _$MyProjectsModelToJson(MyProjectsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'university': instance.university,
      'city': instance.city,
      'userProfile': instance.userProfile,
    };
