import 'dart:convert';

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
    this.id,
    this.etitle,
    this.eschool,
    this.estart,
    this.eend,
  });

  static Map<String, dynamic> toMap(Education education) => {
        'id': education.id,
        'etitle': education.etitle,
        'eschool': education.eschool,
        'estart': education.estart,
        'eend': education.eend,
      };

  static String encode(List<Education> educations) => json.encode(
        educations
            .map<Map<String, dynamic>>((work) => Education.toMap(work))
            .toList(),
      );

  static List<Education> decode(String educations) =>
      (json.decode(educations) as List<dynamic>)
          .map<Education>((item) => Education.fromJson(item))
          .toList();

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
