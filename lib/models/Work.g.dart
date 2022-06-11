// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Work _$WorkFromJson(Map<String, dynamic> json) => Work(
      id: json['_id'] as String?,
      wtitle: json['wtitle'] as String?,
      wcompany: json['wcompany'] as String?,
      wlocation: json['wlocation'] as String?,
      wtype: json['wtype'] as String?,
      wstart: json['wstart'] as String?,
      wend: json['wend'] as String?,
    );

Map<String, dynamic> _$WorkToJson(Work instance) => <String, dynamic>{
      '_id': instance.id,
      'wtitle': instance.wtitle,
      'wcompany': instance.wcompany,
      'wlocation': instance.wlocation,
      'wtype': instance.wtype,
      'wstart': instance.wstart,
      'wend': instance.wend,
    };
