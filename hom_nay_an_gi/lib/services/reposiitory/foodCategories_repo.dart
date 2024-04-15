// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:http/http.dart' as http;

class FoodCategoriesRepo extends GetxService {
  FoodCategoriesRepo();

  var token = "";
  Future<http.Response> getFoodCategoriesList() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.FOOD_CATEGORIES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
