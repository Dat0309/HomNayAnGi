// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:hom_nay_an_gi/services/preferences/user_preference.dart';
import 'package:http/http.dart' as http;

class FoodRepo extends GetxService {
  FoodRepo();

  var token = UserPreference().getToken();

  Future<http.Response> getFoods() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.FOODS),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getFoodByCategory(String catId) async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.FOODS_BY_CATEGORIES + catId),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
