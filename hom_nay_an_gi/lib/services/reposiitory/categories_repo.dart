import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:http/http.dart' as http;

class CategoriesRepo extends GetxService {
  CategoriesRepo();

  var token = "";
  Future<http.Response> getCategoriesList() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.CATEGORIES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
