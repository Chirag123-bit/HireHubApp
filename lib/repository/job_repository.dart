import 'package:hirehub/APIs/job_api.dart';
import 'package:hirehub/response/get_jobs_response.dart';

class JobsRepository {
  Future<JobsResponse?> getAllJobs() async {
    return await JobsAPI().getAllJobs();
  }
}
