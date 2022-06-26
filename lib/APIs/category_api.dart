import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';
import 'package:hirehub/utils/url.dart';

class CategoryAPI {
  Future<CategoryWithCountResponse?> getAllCategories() async {
    CategoryWithCountResponse? categoryResponse;
    var url = baseUrl + categoryUrl;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response.data);
        categoryResponse = CategoryWithCountResponse.fromJson(response.data);
      } else {
        categoryResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return categoryResponse;
  }
}
