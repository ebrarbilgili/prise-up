import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? university;
  String? faculty;
  String? city;
  String? linkedIn;
  String? twitter;
  String? phone;

  UserProfileModel(
      {this.id,
      this.email,
      this.first_name,
      this.last_name,
      this.university,
      this.faculty,
      this.city,
      this.linkedIn,
      this.twitter,
      this.phone});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileModelToJson(this);
  }
}
