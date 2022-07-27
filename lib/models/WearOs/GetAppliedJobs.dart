import 'package:hirehub/models/Job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'GetAppliedJobs.g.dart';

@JsonSerializable()
class AppliedJob {
  Job? job;
  String? appliedDate;
  String? status;

  AppliedJob({
    this.job,
    this.appliedDate,
    this.status,
  });

  factory AppliedJob.fromJson(Map<String, dynamic> json) =>
      _$AppliedJobFromJson(json);
  Map<String, dynamic> toJson() => _$AppliedJobToJson(this);
}
