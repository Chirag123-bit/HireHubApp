import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/response/get_jobs_response.dart';
import 'package:hirehub/utils/url.dart';

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
}
