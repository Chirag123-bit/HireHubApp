// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetApplicants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetApplicants _$GetApplicantsFromJson(Map<String, dynamic> json) =>
    GetApplicants(
      title: json['title'] as String?,
      applicants: (json['applicants'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$GetApplicantsToJson(GetApplicants instance) =>
    <String, dynamic>{
      'title': instance.title,
      'applicants': instance.applicants,
    };
