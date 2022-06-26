import 'package:equatable/equatable.dart';
import 'package:hirehub/models/category/Category.dart';

class CategoryFilter extends Equatable {
  final String id;
  final Category category;
  final bool value;

  const CategoryFilter({
    required this.id,
    required this.category,
    required this.value,
  });

  CategoryFilter copyWith({
    String? id,
    Category? category,
    bool? value,
  }) {
    return CategoryFilter(
        id: id ?? this.id,
        category: category ?? this.category,
        value: value ?? this.value);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        category,
        value,
      ];

  static List<CategoryFilter> filters =
      Category.generatedCategories().map((category) {
    return CategoryFilter(
      id: category.id!,
      category: category,
      value: false,
    );
  }).toList();
}
