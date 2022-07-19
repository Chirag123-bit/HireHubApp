// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_status_change_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobsStatusChangeResponse _$JobsStatusChangeResponseFromJson(
        Map<String, dynamic> json) =>
    JobsStatusChangeResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$JobsStatusChangeResponseToJson(
        JobsStatusChangeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'msg': instance.msg,
    };
