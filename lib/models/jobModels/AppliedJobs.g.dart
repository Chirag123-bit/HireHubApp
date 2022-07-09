// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppliedJobs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedJob _$AppliedJobFromJson(Map<String, dynamic> json) => AppliedJob(
      id: json["job"]['_id'] as String?,
      title: json["job"]['title'] as String?,
      companyName: json["job"]["company"]['name'] as String?,
      companyCountry: json["job"]["company"]['country'] as String?,
      companyRegion: json["job"]["company"]['region'] as String?,
      status: json['status'] as String?,
      appliedDate: json['appliedDate'] as String?,
    );
AppliedJob _$AppliedJobFromJsonTable(Map<String, dynamic> json) => AppliedJob(
      id: json['id'] as String?,
      title: json['title'] as String?,
      companyName: json['companyName'] as String?,
      companyCountry: json['companyCountry'] as String?,
      companyRegion: json['companyRegion'] as String?,
      status: json['status'] as String?,
      appliedDate: json['appliedDate'] as String?,
    );

Map<String, dynamic> _$AppliedJobToJson(AppliedJob instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'companyName': instance.companyName,
      'companyCountry': instance.companyCountry,
      'companyRegion': instance.companyRegion,
      'status': instance.status,
      'appliedDate': instance.appliedDate,
    };
