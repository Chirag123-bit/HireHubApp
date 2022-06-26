import 'package:hirehub/models/category/category_with_count.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_category_with_count_response.g.dart';

@JsonSerializable()
class CategoryWithCountResponse {
  bool? success;
  List<CategoryWithCount>? data;

  CategoryWithCountResponse({
    this.success,
    this.data,
  });

  factory CategoryWithCountResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryWithCountResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryWithCountResponseToJson(this);
}
