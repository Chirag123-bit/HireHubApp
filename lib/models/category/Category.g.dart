// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
    };
