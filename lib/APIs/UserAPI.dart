import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/response/ChatResponse/UserSearchResponse.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:hirehub/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');
    return storedToken;
  }

  Future<bool> updateInfo(Map<String, dynamic> user) async {
    bool isLogin = false;
    Response response;
    String token = await _getToken();
    var url = baseUrl + updateUserUrl;
    var dio = HttpServices().getDioInstance();
    var data = {};
    try {
      for (String key in user.keys) {
        data[key] = user[key];
      }
      // response = await dio.post(url, data: user.toJson());
      response = await dio.put(url,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        isLogin = true;
      } else {
        isLogin = false;
      }
      print(isLogin);
    } catch (e) {
      print(e);
    }
    return isLogin;
  }

  Future<bool> updateCompanyInfo(Map<String, dynamic> user) async {
    bool isLogin = false;
    Response response;
    String token = await _getToken();
    var url = baseUrl + updateCompanyUrl;
    var dio = HttpServices().getDioInstance();
    var data = {};
    try {
      for (String key in user.keys) {
        data[key] = user[key];
      }
      // response = await dio.post(url, data: user.toJson());
      response = await dio.put(url,
          data: data,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        isLogin = true;
      } else {
        isLogin = false;
      }
      print(isLogin);
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
      } else {
        login = null;
      }
    } catch (e) {
      print(e);
    }
    return login;
  }

  Future<UserSearchResponse?> searchUsers(String search) async {
    UserSearchResponse? userSearchResponse;
    String token = await _getToken();
    var url = baseUrl + searchUserRoute + "?search=" + search;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.get(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        // print(response);
        userSearchResponse = UserSearchResponse.fromJson(response.data);
      } else {
        userSearchResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return userSearchResponse;
  }
}
