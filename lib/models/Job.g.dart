// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      about: json['about'] as String?,
      sector: json['sector'] == null
          ? null
          : Category.fromJson(json['sector'] as Map<String, dynamic>),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sallary: json['sallary'] as int?,
      description: json['description'] as String?,
      responsibilities: (json['responsibilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      openDate: json['openDate'] as String?,
      closeDate: json['closeDate'] as String?,
      isActive: json['isActive'] as bool?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'about': instance.about,
      'sector': instance.sector,
      'skills': instance.skills,
      'sallary': instance.sallary,
      'description': instance.description,
      'responsibilities': instance.responsibilities,
      'requirements': instance.requirements,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'isActive': instance.isActive,
      'company': instance.company,
    };
