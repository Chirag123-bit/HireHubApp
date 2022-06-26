// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_with_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryWithCountResponse _$CategoryWithCountResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryWithCountResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryWithCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryWithCountResponseToJson(
        CategoryWithCountResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
