import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/utils/url.dart';

class UserAPI {
  Future<bool> registerUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      print(response);
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

  Future<bool> loginUser(User user) async {
    bool isLogin = false;
    Response response;
    var url = baseUrl + loginUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(url, data: user.toJson());
      print(response);
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
}
