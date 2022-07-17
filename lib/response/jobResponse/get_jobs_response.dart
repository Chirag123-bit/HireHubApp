import 'package:hirehub/models/Job.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_jobs_response.g.dart';

@JsonSerializable()
class JobsResponse {
  bool? success;
  List<Job>? data;

  JobsResponse({
    this.success,
    this.data,
  });

  factory JobsResponse.fromJson(Map<String, dynamic> json) =>
      _$JobsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JobsResponseToJson(this);
}
