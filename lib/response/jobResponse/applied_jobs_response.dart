import 'package:hirehub/models/jobModels/AppliedJobs.dart';
import 'package:json_annotation/json_annotation.dart';

part 'applied_jobs_response.g.dart';

@JsonSerializable()
class AppliedJobsResponse {
  bool? success;
  List<AppliedJob>? data;

  AppliedJobsResponse({
    this.success,
    this.data,
  });

  factory AppliedJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$AppliedJobsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppliedJobsResponseToJson(this);
}
