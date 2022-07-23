import 'dart:io';

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

  Future<bool> updateProfilePic(File img) async {
    try {
      String token = await _getToken();
      const url = baseUrl + changeProfilePic;
      String filename = img.path.split('/').last;
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          img.path,
          filename: filename,
        )
      });
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
        data: formData,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<bool> updatePassword(String oldPassword, String newPassword) async {
    try {
      String token = await _getToken();
      const url = baseUrl + changePassword;

      var dio = HttpServices().getDioInstance();
      Response response = await dio.put(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
        data: {"oldPassword": oldPassword, "password": newPassword},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<Map<String, dynamic>> sendOTP(String id, String email) async {
    Map<String, dynamic> resp = {};
    try {
      String token = await _getToken();
      const url = baseUrl + sendVerification;

      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
        data: {"email": email, "id": id},
      );
      print(response.data);
      if (response.data['status'] == true) {
        resp['success'] = true;
        resp["message"] = response.data["msg"];
      } else {
        resp['success'] = false;
        resp["message"] = response.data["msg"];
      }
    } catch (e) {
      print(e);
    }

    return resp;
  }

  Future<Map<String, dynamic>> verifyOTP(String id, String otp) async {
    Map<String, dynamic> resp = {};
    try {
      String token = await _getToken();
      var url = baseUrl + verifyOTPRoute + "/" + id + "/" + otp + id;

      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
      );
      print(response.data);
      if (response.data['status'] == true ||
          response.data['status'] == "completed") {
        resp['success'] = true;
        resp["message"] = response.data["msg"];
      } else {
        resp['success'] = false;
        resp["message"] = response.data["msg"];
      }
    } catch (e) {
      print(e);
    }

    return resp;
  }
}
