import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:hirehub/utils/url.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      if (response.statusCode == 200) {
        isLogin = true;
      } else {
        isLogin = false;
      }
    } catch (e) {
      print(e);
    }
    return isLogin;
  }

  Future<LoginResponse?> loginUser(User user) async {
    LoginResponse? login;
    var url = baseUrl + loginUrl;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.post(url, data: user.toJson());
      if (response.statusCode == 200) {
        login = LoginResponse.fromJson(response.data);
        print(login.token);
        // print(response.data);
      } else {
        login = null;
      }
    } catch (e) {
      print(e);
    }
    return login;
  }
}
