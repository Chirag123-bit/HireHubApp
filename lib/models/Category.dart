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
        id: '1',
        background: Palette.orangeCard,
        title: "Technology",
        subtitle: "15 Jobs",
        image: "assets/icons/tech.png",
      ),
      Category(
        id: '2',
        background: Palette.pinkCard,
        title: "Health Care",
        subtitle: "7 Jobs",
        image: "assets/icons/health.png",
      ),
      Category(
        id: '3',
        background: Palette.redCard,
        title: "Education",
        subtitle: "9 Jobs",
        image: "assets/icons/education.png",
      ),
      Category(
        id: '4',
        background: Palette.greenCard,
        title: "Entertainment",
        subtitle: "15 Jobs",
        image: "assets/icons/entertainment.png",
      ),
      Category(
        id: '5',
        background: Palette.pinkCard,
        title: "Real Estate",
        subtitle: "4 Jobs",
        image: "assets/icons/real.png",
      ),
      Category(
        id: '6',
        background: Palette.orangeCard,
        title: "Skilled Helper",
        subtitle: "15 Jobs",
        image: "assets/icons/worker.png",
      ),
      Category(
        id: '7',
        background: Palette.purpleCard,
        title: "Marketing",
        subtitle: "15 Jobs",
        image: "assets/icons/marketing.png",
      ),
      Category(
        id: '8',
        background: Palette.redCard,
        title: "Financial Services",
        subtitle: "2 Jobs",
        image: "assets/icons/finance.png",
      ),
    ];
  }
}
