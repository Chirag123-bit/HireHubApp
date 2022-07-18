import 'package:hirehub/APIs/job_api.dart';
import 'package:hirehub/response/jobResponse/applied_jobs_response.dart';
import 'package:hirehub/response/jobResponse/dashboard_jobs_response.dart';
import 'package:hirehub/response/jobResponse/get_jobs_response.dart';

class JobsRepository {
  Future<JobsResponse?> getAllJobs() async {
    return await JobsAPI().getAllJobs();
  }

  Future<AppliedJobsResponse?> getAppliedJobs() async {
    return await JobsAPI().getAppliedJobs();
  }

  Future<DashboardJobsResponse?> getDashboardJobs() async {
    return await JobsAPI().getDashboardJobs();
  }

  Future<bool?> applyForJob(String jobID) async {
    return await JobsAPI().applyForJob(jobID);
  }
}
