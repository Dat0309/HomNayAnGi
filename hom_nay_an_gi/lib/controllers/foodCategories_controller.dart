// ignore_for_file: file_names

import 'dart:convert';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/models/Categories.dart';
import 'package:hom_nay_an_gi/services/reposiitory/foodCategories_repo.dart';

class FoodCategoriesController extends GetxController {
  final FoodCategoriesRepo foodCategoriesRepo;

  FoodCategoriesController({required this.foodCategoriesRepo});

  List<dynamic> foodCategories = [];
  bool isLoaded = false;

  Future<void> getFoodCategories() async {
    await foodCategoriesRepo.getFoodCategoriesList().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['categoreis'].length > 0) {
          foodCategories.clear();
          for (int i = 0; i < resData['categoreis'].length; i++) {
            if (resData['categoreis'][i] != null) {
              Map<String, dynamic> map = resData['categoreis'][i];
              foodCategories.add(Categories.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }
}
