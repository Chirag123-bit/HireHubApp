// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashboardJob.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardJob _$DashboardJobFromJson(Map<String, dynamic> json) {
  DashboardJob db = DashboardJob(
    id: json['data']['_id'] as String?,
    title: json['data']['title'] as String?,
    about: json['data']['about'] as String?,
    sector: null,
    skills: (json['data']['skills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    sallary: json['data']['sallary'] as int?,
    description: json['data']['description'] as String?,
    responsibilities: (json['data']['responsibilities'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    requirements: (json['data']['requirements'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    openDate: json['data']['openDate'] as String?,
    closeDate: json['data']['closeDate'] as String?,
    isActive: json['data']['isActive'] as bool?,
    applicants: (json['data']['applicants'] as List<dynamic>?)
        ?.map((e) => ApplicantModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  return db;
}

Map<String, dynamic> _$DashboardJobToJson(DashboardJob instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'about': instance.about,
      'sector': instance.sector,
      'skills': instance.skills,
      'sallary': instance.sallary,
      'description': instance.description,
      'responsibilities': instance.responsibilities,
      'requirements': instance.requirements,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'isActive': instance.isActive,
      'applicants': instance.applicants,
    };
