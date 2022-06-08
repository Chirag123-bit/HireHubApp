import 'package:hirehub/models/Education.dart';
import 'package:hirehub/models/Work.dart';

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? email;
  String? password;
  String? username;

  String? cname;
  String? country;
  String? region;
  String? cabout;
  String? cdesc;
  String? csector;

  String? title;
  String? sector;
  String? summary;
  List<String>? skills;

  List<Work>? works;
  List<Education>? educations;

  User(
      {this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.password,
      this.username,
      this.gender,
      this.cname,
      this.country,
      this.cabout,
      this.cdesc,
      this.csector,
      this.region,
      this.sector,
      this.skills,
      this.summary,
      this.title});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['cname'] = cname;
    data['country'] = country;
    data['region'] = region;
    data['cabout'] = cabout;
    data['cdesc'] = cdesc;
    data['csector'] = csector;
    data['title'] = title;
    data['sector'] = sector;
    data['skills'] = skills;
    data['summary'] = summary;
    data['work'] = works;
    data['education'] = educations;

    return data;
  }
}
