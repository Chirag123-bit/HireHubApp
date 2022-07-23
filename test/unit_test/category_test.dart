import 'package:flutter_test/flutter_test.dart';
import 'package:hirehub/APIs/category_api.dart';
import 'package:hirehub/models/category/category_dropdown.dart';
import 'package:hirehub/response/categoryResponse/get_category_with_count_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SharedPreferences prefs;
  late CategoryAPI api;

  setUp(() async {
    api = CategoryAPI();
  });

  test("Job Apply Test Pass", () async {
    bool expectedResult = true;
    CategoryWithCountResponse? res = await api.getAllCategories();
    bool actualResult = res!.data != null;
    expect(actualResult, expectedResult);
  });

  test("Fetch Test Pass", () async {
    bool expectedResult = true;
    List<DropdownCategory?> res = await api.getCategoriesDropdown();
    bool actualResult = res.isNotEmpty;

    expect(actualResult, expectedResult);
  });
}
