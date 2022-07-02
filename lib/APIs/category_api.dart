import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/response/categoryResponse/get_category_response.dart';
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
        categoryResponse = CategoryWithCountResponse.fromJson(response.data);
      } else {
        categoryResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return categoryResponse;
  }

  Future<List<DropdownCategory?>> getCategoriesDropdown() async {
    List<DropdownCategory?> categoryLst = [];
    CategoryResponse categoryResponse;
    var url = baseUrl + getAllCat;
    var dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        categoryResponse = CategoryResponse.fromJson(response.data);

        for (var data in categoryResponse.data!) {
          categoryLst.add(DropdownCategory(id: data.title!, title: data.title));
        }
        print(categoryLst);
      }
    } catch (e) {
      print(e);
    }
    return categoryLst;
  }
}
