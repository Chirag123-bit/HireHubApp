// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApplicantModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantModel _$ApplicantModelFromJson(Map<String, dynamic> json) =>
    ApplicantModel(
      applicant: json['applicant'] == null
          ? null
          : User.fromJson(json['applicant'] as Map<String, dynamic>),
      status: json['status'] as String?,
      appliedDate: json['appliedDate'] as String?,
    );

Map<String, dynamic> _$ApplicantModelToJson(ApplicantModel instance) =>
    <String, dynamic>{
      'applicant': instance.applicant,
      'status': instance.status,
      'appliedDate': instance.appliedDate,
    };
