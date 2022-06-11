// import 'package:json_annotation/json_annotation.dart';

// part 'Job.g.dart';

// @JsonSerializable()
class Job {
  // @JsonKey(name: '_id')
  String? id;
  String? company;
  String? logoUrl;
  bool? isMark;
  String? title;
  String? location;
  String? time;
  List<String>? req;

  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);

  static List<Job> generatedJobs() {
    return [
      Job(
        "Google LIC",
        "assets/images/google_logo.png",
        false,
        "Backend Developer",
        "Kathmandu, Nepal",
        "Full Time",
        [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
      ),
      Job(
        "Google LIC",
        "assets/images/google_logo.png",
        false,
        "Backend Developer",
        "Kathmandu, Nepal",
        "Full Time",
        [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
      ),
      Job(
        "Google LIC",
        "assets/images/google_logo.png",
        true,
        "Backend Developer",
        "Kathmandu, Nepal",
        "Full Time",
        [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
      ),
      Job(
        "Google LIC",
        "assets/images/google_logo.png",
        false,
        "Backend Developer",
        "Kathmandu, Nepal",
        "Full Time",
        [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
      ),
    ];
  }
}
