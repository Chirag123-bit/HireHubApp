import 'package:json_annotation/json_annotation.dart';

part 'category_dropdown.g.dart';

@JsonSerializable()
class DropdownCategory {
  @JsonKey(name: '_id')
  String? id;
  String? title;

  DropdownCategory({this.id, this.title});

  factory DropdownCategory.fromJson(Map<String, dynamic> json) =>
      _$DropdownCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$DropdownCategoryToJson(this);
}
