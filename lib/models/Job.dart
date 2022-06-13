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
  String? desc;

  Job(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req, this.desc);

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
          "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns."),
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
          "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns."),
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
          "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns."),
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
          "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns."),
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
          "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns."),
    ];
  }
}
