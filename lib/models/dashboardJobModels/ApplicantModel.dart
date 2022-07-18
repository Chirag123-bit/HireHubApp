// ignore_for_file: non_constant_identifier_names

import 'package:hirehub/models/Users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ApplicantModel.g.dart';

@JsonSerializable()
class ApplicantModel {
  User? applicant;
  String? status;
  String? appliedDate;

  ApplicantModel({
    this.applicant,
    this.status,
    this.appliedDate,
  });

  factory ApplicantModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicantModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantModelToJson(this);
}
