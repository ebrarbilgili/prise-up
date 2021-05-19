import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class GetProjectModel extends INetworkModel {
  int? id;
  UserProfile? userProfile;
  String? title;
  String? subtitle;
  String? desc;
  String? university;
  String? city;

  GetProjectModel({
    this.id,
    this.userProfile,
    this.title,
    this.subtitle,
    this.desc,
    this.university,
    this.city,
  });

  factory GetProjectModel.fromJson(Map<String, dynamic> json) {
    return _$GetProjectModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$GetProjectModelToJson(this);
  }

  @override
  GetProjectModel fromJson(Map<String, dynamic> json) {
    return GetProjectModel.fromJson(json);
  }
}

@JsonSerializable()
class UserProfile extends INetworkModel {
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

  UserProfile({
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

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(this);
  }

  @override
  UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile.fromJson(json);
  }
}
