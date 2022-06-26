import 'package:hirehub/models/Company.dart';
import 'package:hirehub/models/category/Category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Job.g.dart';

@JsonSerializable()
class Job {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? about;
  Category? sector;
  List<String>? skills;
  int? sallary;
  String? description;
  List<String>? responsibilities;
  List<String>? requirements;
  String? openDate;
  String? closeDate;
  bool? isActive;
  Company? company;

  Job(
      {this.id,
      this.title,
      this.about,
      this.sector,
      this.skills,
      this.sallary,
      this.description,
      this.responsibilities,
      this.requirements,
      this.openDate,
      this.closeDate,
      this.isActive,
      this.company});

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);

  static List<Job> generatedJobs() {
    return [
      Job(
        // title:"Google LIC",
        // "assets/images/google_logo.png",
        // false,
        title: "Backend Developer",
        // country:"Kathmandu, Nepal",
        // "Full Time",
        requirements: [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
        about:
            "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns.",
        description:
            "At Verisk you can build an exciting career with meaningful work; create positive and lasting impact on business; and find the support, coaching, and training you need to advance your career. We have received the Great Place to Work® Certification for the fifth consecutive year. We’ve been recognized by Forbes as a World’s Best Employer and a Best Employer for Women, testaments to our culture of engagement and the value we place on an inclusive and diverse workforce. Verisk’s Statement on Racial Equity and Diversity supports our commitment to these values and affecting positive and lasting change in the communities where we live and work.",
      ),
      Job(
        // title:"Google LIC",
        // "assets/images/google_logo.png",
        // false,
        title: "Backend Developer",
        // country:"Kathmandu, Nepal",
        // "Full Time",
        requirements: [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
        about:
            "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns.",
        description:
            "At Verisk you can build an exciting career with meaningful work; create positive and lasting impact on business; and find the support, coaching, and training you need to advance your career. We have received the Great Place to Work® Certification for the fifth consecutive year. We’ve been recognized by Forbes as a World’s Best Employer and a Best Employer for Women, testaments to our culture of engagement and the value we place on an inclusive and diverse workforce. Verisk’s Statement on Racial Equity and Diversity supports our commitment to these values and affecting positive and lasting change in the communities where we live and work.",
      ),
      Job(
        // title:"Google LIC",
        // "assets/images/google_logo.png",
        // false,
        title: "Backend Developer",
        // country:"Kathmandu, Nepal",
        // "Full Time",
        requirements: [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
        about:
            "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns.",
        description:
            "At Verisk you can build an exciting career with meaningful work; create positive and lasting impact on business; and find the support, coaching, and training you need to advance your career. We have received the Great Place to Work® Certification for the fifth consecutive year. We’ve been recognized by Forbes as a World’s Best Employer and a Best Employer for Women, testaments to our culture of engagement and the value we place on an inclusive and diverse workforce. Verisk’s Statement on Racial Equity and Diversity supports our commitment to these values and affecting positive and lasting change in the communities where we live and work.",
      ),
      Job(
        // title:"Google LIC",
        // "assets/images/google_logo.png",
        // false,
        title: "Backend Developer",
        // country:"Kathmandu, Nepal",
        // "Full Time",
        requirements: [
          "Support, development, and data operation workload.",
          "Coordinate and communicate effectively with team members and various stakeholders",
          "Identify and test for bugs and bottlenecks in the ETL solution.",
          "Ensure the best possible performance and quality in the packages."
        ],
        about:
            "We are looking for a dynamic, energetic laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns.",
        description:
            "At Verisk you can build an exciting career with meaningful work; create positive and lasting impact on business; and find the support, coaching, and training you need to advance your career. We have received the Great Place to Work® Certification for the fifth consecutive year. We’ve been recognized by Forbes as a World’s Best Employer and a Best Employer for Women, testaments to our culture of engagement and the value we place on an inclusive and diverse workforce. Verisk’s Statement on Racial Equity and Diversity supports our commitment to these values and affecting positive and lasting change in the communities where we live and work.",
      ),
    ];
  }
}
