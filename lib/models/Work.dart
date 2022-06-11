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
}
