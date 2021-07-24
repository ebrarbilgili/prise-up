import 'package:json_annotation/json_annotation.dart';

part 'create_project_model.g.dart';

@JsonSerializable()
class CreateProjectModel {
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;
  int? userProfile;

  CreateProjectModel({
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
    this.userProfile,
  });

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) {
    return _$CreateProjectModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateProjectModelToJson(this);
  }
}
