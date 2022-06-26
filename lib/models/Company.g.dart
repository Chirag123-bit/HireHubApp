// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      sector: json['sector'] as String?,
      phone: json['phone'] as String?,
      about: json['about'] as String?,
      desc: json['desc'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sector': instance.sector,
      'phone': instance.phone,
      'about': instance.about,
      'desc': instance.desc,
      'country': instance.country,
      'region': instance.region,
      'avatarImage': instance.avatarImage,
    };
