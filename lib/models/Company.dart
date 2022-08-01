import 'package:json_annotation/json_annotation.dart';

part 'Company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? sector;
  String? phone;
  String? about;
  String? desc;
  String? country;
  String? region;
  String? avatarImage;
  // List<Job>? jobs;

  Company({
    this.id,
    this.name,
    this.sector,
    this.phone,
    this.about,
    this.desc,
    this.country,
    this.region,
    this.avatarImage,
    // this.jobs
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  static List<Company> generatedCompanies() {
    return [
      Company(
        id: '1',
        name: "Air BnB",
        avatarImage: "assets/icons/airbnb_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        desc:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '1',
        name: "Google",
        avatarImage: "assets/icons/google_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        desc:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '1',
        name: "Apple Inc",
        avatarImage: "assets/icons/apple_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        desc:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '1',
        name: "Amazon",
        avatarImage: "assets/icons/amazon_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        desc:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
      Company(
        id: '1',
        name: "Microsoft Corporation",
        avatarImage: "assets/icons/microsoft_logo.svg",
        about:
            "Aegis is a complete hotel and restaurant management software that covers the overall transaction of your hotel and restaurant operations. It is easier for you to streamline all tasks, increase revenue, control the expenses, and save the manpower cost. Products are featured from Front of the House to Back of the House with a single database. As per your business needs, we are ready to serve you with both Server Based and Cloud Based solutions.",
        desc:
            "One-stop solution for managing restaurants, bars, resorts, and hotels effectively. Manage multiple tasks in real-time and increase the work efficiency in restaurants, bars, resorts, and hotels.",
        country: "United States",
        region: "California",
      ),
    ];
  }
}
