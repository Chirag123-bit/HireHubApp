// ignore: file_names

import 'package:hirehub/models/WearOs/GetApplicants.dart';

class WearOsGetApplicantsResponse {
  List<GetApplicants>? applicant;

  WearOsGetApplicantsResponse({this.applicant});

  factory WearOsGetApplicantsResponse.fromJson(Map<String, dynamic> json) {
    return WearOsGetApplicantsResponse(
      applicant: (json["data"]['jobs'] as List<dynamic>?)
          ?.map((e) => GetApplicants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
