// ignore: file_names
import 'package:hirehub/models/WearOs/GetAppliedJobs.dart';

class WearOsGetAppliedJobsResponse {
  List<AppliedJob>? jobs;

  WearOsGetAppliedJobsResponse({this.jobs});

  factory WearOsGetAppliedJobsResponse.fromJson(Map<String, dynamic> json) {
    return WearOsGetAppliedJobsResponse(
      jobs: (json["data"]['appliedJobs'] as List<dynamic>?)
          ?.map((e) => AppliedJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
