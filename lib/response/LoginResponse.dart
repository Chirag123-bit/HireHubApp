// ignore: file_names
import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/Users.dart';

class LoginResponse {
  String? token;
  bool? success;
  User? user;
  Company? company;

  LoginResponse({this.token, this.success, this.user, this.company});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      success: json['status'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      company:
          json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'success': success,
      };
}
