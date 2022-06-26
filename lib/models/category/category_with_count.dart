import 'package:hirehub/models/category/Category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_with_count.g.dart';

@JsonSerializable()
class CategoryWithCount {
  Category? category;
  int? jobs;

  CategoryWithCount({this.category, this.jobs});

  factory CategoryWithCount.fromJson(Map<String, dynamic> json) =>
      _$CategoryWithCountFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryWithCountToJson(this);
}
