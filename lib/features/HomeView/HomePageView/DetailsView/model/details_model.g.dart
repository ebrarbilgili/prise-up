// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApplyModel _$PostApplyModelFromJson(Map<String, dynamic> json) {
  return PostApplyModel(
    userProfile: json['userProfile'] as int?,
    project: json['project'] as int?,
  );
}

Map<String, dynamic> _$PostApplyModelToJson(PostApplyModel instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'project': instance.project,
    };
