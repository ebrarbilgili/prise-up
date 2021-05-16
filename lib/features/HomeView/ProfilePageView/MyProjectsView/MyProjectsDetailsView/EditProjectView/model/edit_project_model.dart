import 'package:json_annotation/json_annotation.dart';

part 'edit_project_model.g.dart';

@JsonSerializable()
class EditProjectModel {
  int? id;
  int? userProfile;
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;

  EditProjectModel({
    this.id,
    this.userProfile,
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
  });

  factory EditProjectModel.fromJson(Map<String, dynamic> json) {
    return _$EditProjectModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProjectModelToJson(this);
  }
}
