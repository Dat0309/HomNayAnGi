// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/app_url.dart';
import 'package:hom_nay_an_gi/services/preferences/user_preference.dart';
import 'package:http/http.dart' as http;

class RecipeRepo extends GetxService {
  RecipeRepo();

  var token = UserPreference().getToken();

  Future<http.Response> getRecipes() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.RECIPES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getRecommentRecipes() async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.RECOMMENT_RECIPES),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getRecipeByCategories(String catId) async {
    http.Response res = await http.get(
      Uri.parse(AppUrl.GET_RECIPE_BY_CATEGORIES + catId),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getRecipeByIngredient(String ingr) async {
    http.Response res = await http.get(
      Uri.parse('${AppUrl.GET_RECIPE_BY_INGREDIENT}?ingr=$ingr'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }

  Future<http.Response> getRecipeById(String id) async {
    String token = await UserPreference().getToken();
    http.Response res = await http.get(
      Uri.parse('${AppUrl.RECIPES}/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
