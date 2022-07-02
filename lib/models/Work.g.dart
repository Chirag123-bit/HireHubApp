// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      id: json['_id'] as String?,
      job_title: json['job_title'] as String?,
      company: json['company'] as String?,
      work_location: json['work_location'] as String?,
      work_type: json['work_type'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      '_id': instance.id,
      'job_title': instance.job_title,
      'company': instance.company,
      'work_location': instance.work_location,
      'work_type': instance.work_type,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
