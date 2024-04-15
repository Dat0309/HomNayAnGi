// ignore_for_file: unused_import
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:hom_nay_an_gi/services/preferences/user_preference.dart';
import 'package:http/http.dart' as http;

class MenuRepo extends GetxService {
  MenuRepo();

  var token = UserPreference().getToken();

  Future<http.Response> getMenues() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.MENUES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
