// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'Work.g.dart';

@JsonSerializable()
class Work {
  @JsonKey(name: '_id')
  String? id;
  String? job_title;
  String? company;
  String? company_location;
  String? work_type;
  String? startDate;
  String? endDate;

  Work({
    this.id,
    this.job_title,
    this.company,
    this.company_location,
    this.work_type,
    this.startDate,
    this.endDate,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
