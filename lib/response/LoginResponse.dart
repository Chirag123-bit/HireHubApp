// ignore: file_names
class LoginResponse {
  String? token;
  bool? success;

  LoginResponse({
    this.token,
    this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'success': success,
      };
}
