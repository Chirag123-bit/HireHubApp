import 'package:flutter/cupertino.dart';
import 'package:hirehub/config/Palette.dart';

class Category {
  String? id;
  String? title;
  String? image;
  Color? background;
  String? subtitle;

  Category({
    this.id,
    this.title,
    this.image,
    this.background,
    this.subtitle,
  });

  static List<Category> generatedCategories() {
    return [
      Category(
        background: Palette.orangeCard,
        title: "Technology",
        subtitle: "15 Jobs",
        image: "assets/icons/tech.png",
      ),
      Category(
        background: Palette.pinkCard,
        title: "Health Care",
        subtitle: "7 Jobs",
        image: "assets/icons/health.png",
      ),
      Category(
        background: Palette.redCard,
        title: "Education",
        subtitle: "9 Jobs",
        image: "assets/icons/education.png",
      ),
      Category(
        background: Palette.greenCard,
        title: "Entertainment",
        subtitle: "15 Jobs",
        image: "assets/icons/entertainment.png",
      ),
      Category(
        background: Palette.pinkCard,
        title: "Real Estate",
        subtitle: "4 Jobs",
        image: "assets/icons/real.png",
      ),
      Category(
        background: Palette.orangeCard,
        title: "Skilled Helper",
        subtitle: "15 Jobs",
        image: "assets/icons/worker.png",
      ),
      Category(
        background: Palette.purpleCard,
        title: "Marketing",
        subtitle: "15 Jobs",
        image: "assets/icons/marketing.png",
      ),
      Category(
        background: Palette.redCard,
        title: "Financial Services",
        subtitle: "2 Jobs",
        image: "assets/icons/finance.png",
      ),
    ];
  }
}
