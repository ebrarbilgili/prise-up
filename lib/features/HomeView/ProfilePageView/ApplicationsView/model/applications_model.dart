import 'package:json_annotation/json_annotation.dart';

part 'applications_model.g.dart';

@JsonSerializable()
class ApplicationsModel {
  int? id;
  Project? project;
  int? userProfile;

  ApplicationsModel({this.id, this.project, this.userProfile});

  factory ApplicationsModel.fromJson(Map<String, dynamic> json) {
    return _$ApplicationsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplicationsModelToJson(this);
  }
}

@JsonSerializable()
class Project {
  int? id;
  UserProfile? userProfile;
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;

  Project({
    this.id,
    this.userProfile,
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return _$ProjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProjectToJson(this);
  }
}

@JsonSerializable()
class UserProfile {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? university;
  String? faculty;
  String? city;

  UserProfile({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.university,
    this.faculty,
    this.city,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(this);
  }
}
