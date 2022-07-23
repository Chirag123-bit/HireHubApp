// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedJobsResponse _$AppliedJobsResponseFromJson(Map<String, dynamic> json) =>
    AppliedJobsResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppliedJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppliedJobsResponseToJson(
        AppliedJobsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
