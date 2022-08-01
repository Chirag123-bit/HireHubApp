import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/APIs/job_api.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/repository/UserRepository.dart';
import 'package:hirehub/response/LoginResponse.dart';
import 'package:hirehub/response/jobResponse/applied_jobs_response.dart';
import 'package:hirehub/response/jobResponse/get_jobs_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late User user;
  String jobId = "62b6e3aac7312bb1f95488a8";
  SharedPreferences prefs;
  late JobsAPI api;

  setUp(() async {
    api = JobsAPI();
    user = User();
    jobId = "62b6e3aac7312bb1f95488a8";
    user.username = "Chirag";
    user.password = "Abcd";
    prefs = await SharedPreferences.getInstance();
    LoginResponse? login = await UserRepository().loginUser(user);
    prefs.setString("token", login!.token!);
  });

  group("Job Apply Test", () {
    test("Job Apply Test Fail", () async {
      prefs = await SharedPreferences.getInstance();
      bool expectedResult = true;
      bool actualResult = await api.applyForJob(jobId);
      expect(actualResult, expectedResult);
    });
    test("Job Apply Test Pass", () async {
      bool expectedResult = false;
      bool actualResult = await api.applyForJob(jobId);
      expect(actualResult, expectedResult);
    });
  });

  group("Job Fetch Test", () {
    test("Fetch Test Pass", () async {
      bool expectedResult = true;
      JobsResponse? actualResult = await api.getAllJobs();

      expect(actualResult!.success, expectedResult);
    });
  });

  group("Applied Jobs Fetch Test", () {
    test("Apply Fetch Test Pass", () async {
      bool expectedResult = true;
      AppliedJobsResponse? res = await api.getAppliedJobs();
      bool actualResult = res?.success ?? true;

      expect(actualResult, expectedResult);
    });
    test("Apply Fetch Test Fail", () async {
      prefs = await SharedPreferences.getInstance();
      prefs.clear();
      bool expectedResult = false;
      AppliedJobsResponse? res = await api.getAppliedJobs();
      bool actualResult = res!.success ?? false;

      expect(actualResult, expectedResult);
    });
  });

  tearDown() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
