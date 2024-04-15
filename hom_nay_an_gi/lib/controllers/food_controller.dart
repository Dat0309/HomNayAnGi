// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/models/Food.dart';
import 'package:hom_nay_an_gi/services/reposiitory/food_repo.dart';

class FoodController extends GetxController {
  final FoodRepo foodRepo;
  FoodController({
    required this.foodRepo,
  });

  List<dynamic> foods = [];
  List<dynamic> categoriesFoods = [];

  bool isLoaded = false;
  bool isLoadedCategoriesFoods = false;

  Future<void> getFoods() async {
    await foodRepo.getFoods().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['foods'].length > 0) {
          foods.clear();
          for (int i = 0; i < res['foods'].length; i++) {
            if (res['foods'][i] != null) {
              Map<String, dynamic> map = res['foods'][i];
              foods.add(Food.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> getFoodByCatId(String catId) async {
    isLoadedCategoriesFoods = false;
    categoriesFoods.clear();
    await foodRepo.getFoodByCategory(catId).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['foods'].length > 0) {
          for (int i = 0; i < res['foods'].length; i++) {
            if (res['foods'][i] != null) {
              Map<String, dynamic> map = res['foods'][i];
              categoriesFoods.add(Food.fromMap(map));
            }
          }
          isLoadedCategoriesFoods = true;
          update();
        }
      } else {}
      return value;
    });
  }
}
