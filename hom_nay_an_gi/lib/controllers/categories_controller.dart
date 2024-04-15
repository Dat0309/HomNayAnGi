import 'dart:convert';

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/models/Categories.dart';
import 'package:hom_nay_an_gi/services/reposiitory/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo categoriesRepo;

  CategoriesController({required this.categoriesRepo});

  List<dynamic> categories = [];
  bool isLoaded = false;

  Future<void> getCategories() async {
    await categoriesRepo.getCategoriesList().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData['categoreis'].length > 0) {
          categories.clear();
          for (int i = 0; i < resData['categoreis'].length; i++) {
            if (resData['categoreis'][i] != null) {
              Map<String, dynamic> map = resData['categoreis'][i];
              categories.add(Categories.fromMap(map));
            }
          }
          isLoaded = true;
          Get.find<RecipeController>()
              .getRecipeByCategories('6350f60a0831c40335c0273a');
          update();
        }
      } else {}
      return value;
    });
  }
}
