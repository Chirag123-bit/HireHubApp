// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_with_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryWithCount _$CategoryWithCountFromJson(Map<String, dynamic> json) =>
    CategoryWithCount(
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      jobs: json['jobs'] as int?,
    );

Map<String, dynamic> _$CategoryWithCountToJson(CategoryWithCount instance) =>
    <String, dynamic>{
      'category': instance.category,
      'jobs': instance.jobs,
    };
