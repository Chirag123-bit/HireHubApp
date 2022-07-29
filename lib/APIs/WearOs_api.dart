import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/response/WearOsResponse/getApplicantsResponse.dart';
import 'package:hirehub/response/WearOsResponse/getAppliedJobsResponse.dart';
import 'package:hirehub/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WearOsApi {
  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');
    return storedToken;
  }

  Future<WearOsGetAppliedJobsResponse?> getAppliedJobs() async {
    WearOsGetAppliedJobsResponse? jobsResponse;
    try {
      String token = await _getToken();
      const url = baseUrl + getAppliedJobsWear;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
      );
      if (response.statusCode == 200) {
        jobsResponse = WearOsGetAppliedJobsResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }

    return jobsResponse;
  }

  Future<WearOsGetApplicantsResponse?> getApplicants() async {
    WearOsGetApplicantsResponse? jobsResponse;
    try {
      String token = await _getToken();
      const url = baseUrl + getJobsWearOs;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
      );
      if (response.statusCode == 200) {
        jobsResponse = WearOsGetApplicantsResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }

    return jobsResponse;
  }
}
