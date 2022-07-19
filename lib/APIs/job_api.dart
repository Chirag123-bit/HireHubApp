import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/response/jobResponse/applied_jobs_response.dart';
import 'package:hirehub/response/jobResponse/dashboard_jobs_response.dart';
import 'package:hirehub/response/jobResponse/get_jobs_response.dart';
import 'package:hirehub/response/jobResponse/job_status_change_response.dart';
import 'package:hirehub/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobsAPI {
  Future<JobsResponse?> getAllJobs() async {
    JobsResponse? jobsResponse;
    var url = baseUrl + jobsUrl;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        jobsResponse = JobsResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return jobsResponse;
  }

  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');
    return storedToken;
  }

  Future<bool> applyForJob(String jobId) async {
    bool isSuccess = false;
    Response response;
    String token = await _getToken();
    var url = baseUrl + applyJobUrl;
    var dio = HttpServices().getDioInstance();
    var data = {
      'job': jobId,
    };
    try {
      response = await dio.post(url,
          data: jsonEncode(data),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        isSuccess = true;
      } else {
        isSuccess = false;
      }
    } catch (e) {
      // print(e);
    }
    return isSuccess;
  }

  //Get Applied Jobs
  Future<AppliedJobsResponse?> getAppliedJobs() async {
    AppliedJobsResponse? jobsResponse;
    var url = baseUrl + appliedJobsUrl;
    var dio = HttpServices().getDioInstance();
    String token = await _getToken();
    try {
      Response response = await dio.get(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        jobsResponse = AppliedJobsResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return jobsResponse;
  }

  Future<DashboardJobsResponse?> getDashboardJobs() async {
    DashboardJobsResponse? jobsResponse;
    var url = baseUrl + employerDashboardUrl;
    var dio = HttpServices().getDioInstance();
    String token = await _getToken();
    try {
      Response response = await dio.get(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }));
      if (response.statusCode == 200) {
        jobsResponse = DashboardJobsResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return jobsResponse;
  }

  Future<JobsStatusChangeResponse?> changeStatus(
      String userId, String jobId, String status) async {
    JobsStatusChangeResponse? jobsResponse;
    var url = baseUrl + updateJobStatus;
    var dio = HttpServices().getDioInstance();
    String token = await _getToken();
    try {
      Response response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          }),
          data: {
            "job_id": jobId,
            "user_id": userId,
            "status": status,
          });
      if (response.statusCode == 200) {
        jobsResponse = JobsStatusChangeResponse.fromJson(response.data);
      } else {
        jobsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return jobsResponse;
  }
}
