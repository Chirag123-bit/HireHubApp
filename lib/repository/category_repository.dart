import 'package:hirehub/APIs/category_api.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';

class CategoryRepository {
  Future<CategoryWithCountResponse?> getAllCategory() async {
    return await CategoryAPI().getAllCategories();
  }
}
