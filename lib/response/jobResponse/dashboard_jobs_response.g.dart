// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_jobs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardJobsResponse _$DashboardJobsResponseFromJson(
        Map<String, dynamic> json) =>
    DashboardJobsResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DashboardJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardJobsResponseToJson(
        DashboardJobsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
