// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map<String, dynamic> json) => Education(
      id: json['_id'] as String?,
      etitle: json['etitle'] as String?,
      eschool: json['eschool'] as String?,
      estart: json['estart'] as String?,
      eend: json['eend'] as String?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      '_id': instance.id,
      'etitle': instance.etitle,
      'eschool': instance.eschool,
      'estart': instance.estart,
      'eend': instance.eend,
    };
