import 'package:hirehub/models/TestJob.dart';

final responsibilities = [
  'Work effectively as a member of self-organized agile team that builds, owns and runs the service',
  'Contribute to all aspects of service development including front-end, back-end, devops and quality',
  'Assist in the operation of the service, e.g. monitoring, alerting, metrics, logging and troubleshooting',
  'Work closely with architect and product management to understand requirements and translate them to elegant implementations',
  'Use the current system behavior to identify opportunities for continuous improvement of the scalability, reliability, usability and security of the system',
  'Excellent troubleshooting skills, able to debug complex technical issues involving multiple system components',
];

final qualifications = [
  'BS or MS in Computer Science or related technical field',
  'More than 8 years of experience building web applications',
  'Experience with ASP.NET MVC/Web API/RESTful API design',
  'Expert level experience with programming languages such as C#/Java',
  'Expert level experience in building services with high performance, high availability at web scale',
];

final popularJobs = [
  Job(
    id: 1,
    companyName: 'Airbnb, Inc.',
    imgUrl: 'assets/icons/airbnb_logo.svg',
    position: 'Software Engineer',
    location: 'Singapore, Permanent, Remote',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Full Time",
  ),
  Job(
    id: 2,
    companyName: 'Airbnb, Inc.',
    imgUrl: 'assets/icons/airbnb_logo.svg',
    position: 'Lead Product Designer',
    location: 'Singapore, Permanent, Remote',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Full Time",
  ),
  Job(
    id: 3,
    companyName: 'Google LLC',
    imgUrl: 'assets/icons/google_logo.svg',
    position: 'Software Engineer',
    location: 'Singapore, Permanent',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Part Time",
  ),
];

final recentJobs = [
  Job(
    id: 4,
    companyName: 'Google LLC',
    imgUrl: 'assets/icons/google_logo.svg',
    position: 'Senior Software Engineer',
    location: 'Singapore, Permanent',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Part Time",
  ),
  Job(
    id: 5,
    companyName: 'Apple Inc.',
    imgUrl: 'assets/icons/apple_logo.svg',
    position: 'Lead Product Designer',
    location: 'Singapore, Contract',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Remote",
  ),
  Job(
    id: 6,
    companyName: 'Google LLC',
    imgUrl: 'assets/icons/google_logo.svg',
    position: 'Software Engineer',
    location: 'Singapore, Permanent',
    responsibilities: responsibilities,
    qualifications: qualifications,
    type: "Full Time",
  ),
];
