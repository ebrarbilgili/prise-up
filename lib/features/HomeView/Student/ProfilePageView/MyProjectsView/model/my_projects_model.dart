import 'package:json_annotation/json_annotation.dart';

part 'my_projects_model.g.dart';

@JsonSerializable()
class MyProjectsModel {
  int? id;
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;
  dynamic userProfile;

  MyProjectsModel({
    this.id,
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
    this.userProfile,
  });

  factory MyProjectsModel.fromJson(Map<String, dynamic> json) {
    return _$MyProjectsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MyProjectsModelToJson(this);
  }
}
