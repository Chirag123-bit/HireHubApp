import 'package:hirehub/models/category/Category.dart';
import 'package:hirehub/models/dashboardJobModels/ApplicantModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DashboardJob.g.dart';

@JsonSerializable()
class DashboardJob {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? about;
  Category? sector;
  List<String>? skills;
  int? sallary;
  String? description;
  List<String>? responsibilities;
  List<String>? requirements;
  String? openDate;
  String? closeDate;
  bool? isActive;
  List<ApplicantModel>? applicants;

  DashboardJob({
    this.id,
    this.title,
    this.about,
    this.sector,
    this.skills,
    this.sallary,
    this.description,
    this.responsibilities,
    this.requirements,
    this.openDate,
    this.closeDate,
    this.isActive,
    this.applicants,
  });

  factory DashboardJob.fromJson(Map<String, dynamic> json) =>
      _$DashboardJobFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardJobToJson(this);
}
