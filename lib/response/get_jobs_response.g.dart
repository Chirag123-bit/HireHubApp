// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobsResponse _$JobsResponseFromJson(Map<String, dynamic> json) => JobsResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobsResponseToJson(JobsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
