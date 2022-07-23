// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isVerified: json['isVerified'].toString() as String,
      username: json['username'] as String?,
      gender: json['gender'] as String?,
      type: json['type'] as String?,
      avatarImage: json['avatarImage'] as String?,
      // cname: json['cname'] as String?,
      // country: json['country'] as String?,
      // cabout: json['cabout'] as String?,
      // cdesc: json['cdesc'] as String?,
      // csector: json['csector'] as String?,
      // region: json['region'] as String?,
      sector: json["professional"]['sector'] as String?,
      skills: (json["professional"]['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      summary: json['summary'] as String?,
      title: json["professional"]['title'] as String?,
      workSet: (json["additional"][0]['experience'] as List<dynamic>?)
          ?.map((e) => Work.fromJson(e as Map<String, dynamic>))
          .toList(),
      educationSet: (json["additional"][0]['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'phone': instance.phone,
      'email': instance.email,
      'type': instance.type,
      'password': instance.password,
      'username': instance.username,
      'cname': instance.cname,
      'country': instance.country,
      'region': instance.region,
      'cabout': instance.cabout,
      'isVerified': instance.isVerified,
      'cdesc': instance.cdesc,
      'csector': instance.csector,
      'title': instance.title,
      'sector': instance.sector,
      'summary': instance.summary,
      'skills': instance.skills,
      'workSet': instance.workSet,
      'educationSet': instance.educationSet,
    };
