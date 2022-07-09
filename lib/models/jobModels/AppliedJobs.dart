import 'package:json_annotation/json_annotation.dart';

part 'AppliedJobs.g.dart';

@JsonSerializable()
class AppliedJob {
  String? id;
  String? title;
  String? companyName;
  String? companyCountry;
  String? companyRegion;
  String? status;
  String? appliedDate;

  AppliedJob({
    this.id,
    this.title,
    this.companyName,
    this.companyCountry,
    this.companyRegion,
    this.status,
    this.appliedDate,
  });

  factory AppliedJob.fromJson(Map<String, dynamic> json) =>
      _$AppliedJobFromJson(json);
  Map<String, dynamic> toJson() => _$AppliedJobToJson(this);

  factory AppliedJob.fromJsonTable(Map<String, dynamic> json) =>
      _$AppliedJobFromJsonTable(json);
}
