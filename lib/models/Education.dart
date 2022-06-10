import 'package:json_annotation/json_annotation.dart';

part 'Education.g.dart';

@JsonSerializable()
class Education {
  @JsonKey(name: '_id')
  String? id;
  String? etitle;
  String? eschool;
  String? estart;
  String? eend;

  Education({
    this.etitle,
    this.eschool,
    this.estart,
    this.eend,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
