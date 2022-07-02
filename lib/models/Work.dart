import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'Work.g.dart';

@JsonSerializable()
class Work {
  @JsonKey(name: '_id')
  String? id;
  String? wtitle;
  String? wcompany;
  String? wlocation;
  String? wtype;
  String? wstart;
  String? wend;

  Work({
    this.id,
    this.wtitle,
    this.wcompany,
    this.wlocation,
    this.wtype,
    this.wstart,
    this.wend,
  });

  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);
  Map<String, dynamic> toJson() => _$WorkToJson(this);

  static Map<String, dynamic> toMap(Work work) => {
        'id': work.id,
        'wtitle': work.wtitle,
        'wcompany': work.wcompany,
        'wlocation': work.wlocation,
        'wtype': work.wtype,
        'wstart': work.wstart,
        'wend': work.wend,
      };

  static String encode(List<Work> works) => json.encode(
        works.map<Map<String, dynamic>>((work) => Work.toMap(work)).toList(),
      );

  static List<Work> decode(String works) =>
      (json.decode(works) as List<dynamic>)
          .map<Work>((item) => Work.fromJson(item))
          .toList();
}
