import 'package:json_annotation/json_annotation.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class BusinessGetProjectModel {
  int? id;
  UserProfile? userProfile;
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;

  BusinessGetProjectModel({
    this.id,
    this.userProfile,
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
  });

  factory BusinessGetProjectModel.fromJson(Map<String, dynamic> json) {
    return _$BusinessGetProjectModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BusinessGetProjectModelToJson(this);
  }
}

@JsonSerializable()
class UserProfile {
  int? id;
  String? last_login;
  bool? is_superuser;
  String? date_joined;
  String? email;
  int? account_type;
  String? first_name;
  String? last_name;
  bool? is_active;
  bool? is_admin;
  String? university;
  String? faculty;
  String? city;
  String? linkedIn;
  String? twitter;
  String? phone;

  UserProfile({
    this.id,
    this.last_login,
    this.is_superuser,
    this.date_joined,
    this.email,
    this.account_type,
    this.first_name,
    this.last_name,
    this.is_active,
    this.is_admin,
    this.university,
    this.faculty,
    this.city,
    this.linkedIn,
    this.twitter,
    this.phone,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(this);
  }
}
