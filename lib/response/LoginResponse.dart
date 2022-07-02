// ignore: file_names
import 'package:hirehub/models/Users.dart';

class LoginResponse {
  String? token;
  bool? success;
  User? user;

  LoginResponse({this.token, this.success, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        token: json['token'],
        success: json['status'],
        user: json['user'] != null ? User.fromJson(json['user']) : null);
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'success': success,
      };
}
