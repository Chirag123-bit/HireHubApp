import 'package:json_annotation/json_annotation.dart';

part 'GetApplicants.g.dart';

@JsonSerializable()
class GetApplicants {
  String? title;
  List<Map<String, dynamic>>? applicants;

  GetApplicants({
    this.title,
    this.applicants,
  });

  factory GetApplicants.fromJson(Map<String, dynamic> json) =>
      _$GetApplicantsFromJson(json);
  Map<String, dynamic> toJson() => _$GetApplicantsToJson(this);
}
