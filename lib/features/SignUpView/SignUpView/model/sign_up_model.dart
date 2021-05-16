import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? first_name;
  String? last_name;
  String? university;
  String? faculty;
  String? city;
  String? twitter;
  String? linkedIn;
  String? phone;
  int? user;

  SignUpModel({
    this.first_name,
    this.last_name,
    this.university,
    this.faculty,
    this.city,
    this.twitter,
    this.linkedIn,
    this.phone,
    this.user,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpModelToJson(this);
  }
}
