import 'package:json_annotation/json_annotation.dart';

part 'my_projects_details_model.g.dart';

@JsonSerializable()
class MyProjectsDetailsModel {
  int? id;
  ApplyUserProfile? applyUserProfile;
  Project? project;

  MyProjectsDetailsModel({
    this.id,
    this.applyUserProfile,
    this.project,
  });

  factory MyProjectsDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MyProjectsDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MyProjectsDetailsModelToJson(this);
  }
}

@JsonSerializable()
class ApplyUserProfile {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? university;
  String? faculty;
  String? city;
  String? twitter;
  String? linkedIn;
  String? phone;

  ApplyUserProfile({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.university,
    this.faculty,
    this.city,
    this.twitter,
    this.linkedIn,
    this.phone,
  });

  factory ApplyUserProfile.fromJson(Map<String, dynamic> json) {
    return _$ApplyUserProfileFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplyUserProfileToJson(this);
  }
}

@JsonSerializable()
class Project {
  int? id;
  ApplyUserProfile? userProfile;
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
  String? first_name;
  String? last_name;
  String? university;
  String? faculty;
  String? city;

  UserProfile({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
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
