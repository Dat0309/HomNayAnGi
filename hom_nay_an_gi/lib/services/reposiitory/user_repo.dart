// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:hom_nay_an_gi/services/preferences/user_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  UserRepo({required this.sharedPreferences});

  Future<http.Response> getProfile() async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse(AppUrl.PROFILE),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
