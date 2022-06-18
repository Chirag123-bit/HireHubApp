import 'package:equatable/equatable.dart';
import 'package:hirehub/models/Category.dart';

class CategoryFilter extends Equatable {
  final String id;
  final Category category;
  final bool value;

  const CategoryFilter({
    required this.category,
    required this.id,
    required this.value,
  });

  CategoryFilter copyWith({
    Category? category,
    String? id,
    bool? value,
  }) {
    return CategoryFilter(
      category: category ?? this.category,
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, category, value];

  static List<CategoryFilter> filters =
      Category.generatedCategories().map((category) {
    return CategoryFilter(
      category: category,
      id: category.id!,
      value: false,
    );
  }).toList();
}
