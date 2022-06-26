import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? image;
  String? description;

  Category({
    this.id,
    this.title,
    this.image,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static List<Category> generatedCategories() {
    return [
      Category(
        id: '1',
        title: "Technology",
        description: "15 Jobs",
        image: "assets/icons/tech.png",
      ),
      Category(
        id: '2',
        title: "Health Care",
        description: "7 Jobs",
        image: "assets/icons/health.png",
      ),
      Category(
        id: '3',
        title: "Education",
        description: "9 Jobs",
        image: "assets/icons/education.png",
      ),
      Category(
        id: '4',
        title: "Entertainment",
        description: "15 Jobs",
        image: "assets/icons/entertainment.png",
      ),
      Category(
        id: '5',
        title: "Real Estate",
        description: "4 Jobs",
        image: "assets/icons/real.png",
      ),
      Category(
        id: '6',
        title: "Skilled Helper",
        description: "15 Jobs",
        image: "assets/icons/worker.png",
      ),
      Category(
        id: '7',
        title: "Marketing",
        description: "15 Jobs",
        image: "assets/icons/marketing.png",
      ),
      Category(
        id: '8',
        title: "Financial Services",
        description: "2 Jobs",
        image: "assets/icons/finance.png",
      ),
    ];
  }
}
