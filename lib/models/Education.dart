import 'package:json_annotation/json_annotation.dart';

part 'Education.g.dart';

@JsonSerializable()
class Education {
  @JsonKey(name: '_id')
  String? id;
  String? degree;
  String? college;
  String? startDate;
  String? endDate;

  Education({
    this.id,
    this.degree,
    this.college,
    this.startDate,
    this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
