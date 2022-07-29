// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetAppliedJobs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedJob _$AppliedJobFromJson(Map<String, dynamic> json) => AppliedJob(
      job: json['job'] == null
          ? null
          : Job.fromJson(json['job'] as Map<String, dynamic>),
      appliedDate: json['appliedDate'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AppliedJobToJson(AppliedJob instance) =>
    <String, dynamic>{
      'job': instance.job,
      'appliedDate': instance.appliedDate,
      'status': instance.status,
    };
