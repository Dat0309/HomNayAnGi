// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/controllers/auth_controller.dart';
import 'package:hom_nay_an_gi/controllers/categories_controller.dart';
import 'package:hom_nay_an_gi/controllers/foodCategories_controller.dart';
import 'package:hom_nay_an_gi/controllers/food_controller.dart';
import 'package:hom_nay_an_gi/controllers/menu_controller.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/controllers/user_controller.dart';
import 'package:hom_nay_an_gi/services/reposiitory/auth_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/categories_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/foodCategories_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/food_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/menu_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/recipe_repo.dart';
import 'package:hom_nay_an_gi/services/reposiitory/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDependentcies {
  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => FoodRepo());
    Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find()));
    Get.lazyPut(() => CategoriesRepo());
    Get.lazyPut(() => FoodCategoriesRepo());
    Get.lazyPut(() => MenuRepo());
    Get.lazyPut(() => RecipeRepo());
    Get.lazyPut(() => UserRepo(sharedPreferences: Get.find()));

    Get.lazyPut(() => AuthController(authRepo: Get.find()));
    Get.lazyPut(() => CategoriesController(categoriesRepo: Get.find()));
    Get.lazyPut(() => FoodController(foodRepo: Get.find()));
    Get.lazyPut(() => FoodCategoriesController(foodCategoriesRepo: Get.find()));
    Get.lazyPut(() => RecipeController(recipeRepo: Get.find()));
    Get.lazyPut(() => UserController(userRepo: Get.find()));
    Get.lazyPut(() => MenuController(menuRepo: Get.find()));
  }
}
