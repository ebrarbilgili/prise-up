import 'package:json_annotation/json_annotation.dart';

part 'details_model.g.dart';

@JsonSerializable()
class PostApplyModel {
  int? userProfile;
  int? project;
  PostApplyModel({
    this.userProfile,
    this.project,
  });

  factory PostApplyModel.fromJson(Map<String, dynamic> json) {
    return _$PostApplyModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostApplyModelToJson(this);
  }
}
