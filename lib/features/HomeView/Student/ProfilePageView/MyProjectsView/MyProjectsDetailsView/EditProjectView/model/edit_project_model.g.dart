// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProjectModel _$EditProjectModelFromJson(Map<String, dynamic> json) {
  return EditProjectModel(
    id: json['id'] as int?,
    userProfile: json['userProfile'] as int?,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
    desc: json['desc'] as String?,
    university: json['university'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$EditProjectModelToJson(EditProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userProfile': instance.userProfile,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'university': instance.university,
      'city': instance.city,
    };
