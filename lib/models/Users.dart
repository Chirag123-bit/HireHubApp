import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Work.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Users.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? email;
  String? type;
  String? password;
  String? username;
  String? isVerified;

  String? cname;
  String? country;
  String? region;
  String? cabout;
  String? cdesc;
  String? csector;
  String? avatarImage;

  String? title;
  String? sector;
  String? summary;
  List<String>? skills;

  List<Work>? workSet;
  List<Education>? educationSet;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
    this.username,
    this.gender,
    this.type,
    this.cname,
    this.country,
    this.cabout,
    this.cdesc,
    this.csector,
    this.region,
    this.sector,
    this.skills,
    this.summary,
    this.title,
    this.workSet,
    this.educationSet,
    this.avatarImage,
    this.isVerified,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
