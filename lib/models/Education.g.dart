// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      id: json['_id'] as String?,
      degree: json['degree'] as String?,
      college: json['college'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      '_id': instance.id,
      'degree': instance.degree,
      'college': instance.college,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
