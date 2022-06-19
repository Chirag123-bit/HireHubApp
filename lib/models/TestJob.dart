class Job {
  final int id;
  final String companyName;
  final String imgUrl;
  final String position;
  final String location;
  final String type;
  final List<String> responsibilities;
  final List<String> qualifications;

  Job({
    required this.id,
    required this.companyName,
    required this.imgUrl,
    required this.position,
    required this.location,
    required this.type,
    required this.responsibilities,
    required this.qualifications,
  });
}
