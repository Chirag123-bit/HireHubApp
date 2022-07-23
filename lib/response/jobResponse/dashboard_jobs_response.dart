import 'package:hirehub/models/dashboardJobModels/DashboardJob.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_jobs_response.g.dart';

@JsonSerializable()
class DashboardJobsResponse {
  bool? success;
  List<DashboardJob>? data;

  DashboardJobsResponse({
    this.success,
    this.data,
  });

  factory DashboardJobsResponse.fromJson(Map<String, dynamic> json) {
    return _$DashboardJobsResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DashboardJobsResponseToJson(this);
}
