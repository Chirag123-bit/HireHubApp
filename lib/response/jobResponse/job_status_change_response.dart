import 'package:json_annotation/json_annotation.dart';

part 'job_status_change_response.g.dart';

@JsonSerializable()
class JobsStatusChangeResponse {
  bool? success;
  String? msg;

  JobsStatusChangeResponse({
    this.success,
    this.msg,
  });

  factory JobsStatusChangeResponse.fromJson(Map<String, dynamic> json) =>
      _$JobsStatusChangeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JobsStatusChangeResponseToJson(this);
}
