// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/models/Recipe.dart';
import 'package:hom_nay_an_gi/services/reposiitory/recipe_repo.dart';

class RecipeController extends GetxController {
  final RecipeRepo recipeRepo;
  RecipeController({
    required this.recipeRepo,
  });

  List<dynamic> recipes = [];
  List<dynamic> recipeRecomment = [];
  List<dynamic> recipeCategories = [];
  List<dynamic> recipeByIngredient = [];

  bool isLoaded = false;
  bool isLoadedRecommentRecipes = false;
  bool isLoadedRecipeByCategories = false;
  bool isLoadedRecipeByIngredient = false;
  bool isLoadedRecipe = false;

  Future<void> getRecipes() async {
    await recipeRepo.getRecipes().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['recipes'].length > 0) {
          recipes.clear();
          for (int i = 0; i < res['recipes'].length; i++) {
            if (res['recipes'][i] != null) {
              Map<String, dynamic> map = res['recipes'][i];
              recipes.add(Recipe.fromMap(map));
            }
          }
          isLoaded = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> getRecommentRecipes() async {
    await recipeRepo.getRecommentRecipes().then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['recipes'].length > 0) {
          recipeRecomment.clear();
          for (int i = 0; i < res['recipes'].length; i++) {
            if (res['recipes'][i] != null) {
              Map<String, dynamic> map = res['recipes'][i];
              recipeRecomment.add(Recipe.fromMap(map));
            }
          }
          isLoadedRecommentRecipes = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> getRecipeByCategories(String catId) async {
    isLoadedRecipeByCategories = false;
    await recipeRepo.getRecipeByCategories(catId).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['recipes'].length > 0) {
          recipeCategories.clear();
          for (int i = 0; i < res['recipes'].length; i++) {
            if (res['recipes'][i] != null) {
              Map<String, dynamic> map = res['recipes'][i];
              recipeCategories.add(Recipe.fromMap(map));
            }
          }
          isLoadedRecipeByCategories = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<void> getRecipeByIngredient(String ingr) async {
    await recipeRepo.getRecipeByIngredient(ingr).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> res = json.decode(value.body);

        if (res['recipes'].length > 0) {
          recipeByIngredient.clear();
          for (int i = 0; i < res['recipes'].length; i++) {
            if (res['recipes'][i] != null) {
              Map<String, dynamic> map = res['recipes'][i];
              recipeByIngredient.add(Recipe.fromMap(map));
            }
          }
          isLoadedRecipeByIngredient = true;
          update();
        }
      } else {}
      return value;
    });
  }

  Future<Recipe> getRecipeById(String id) async {
    isLoadedRecipe = false;
    Recipe result = Recipe();
    await recipeRepo.getRecipeById(id).then((value) {
      if (value.statusCode == 200) {
        final Map<String, dynamic> resData = json.decode(value.body);

        if (resData.isNotEmpty) {
          result = Recipe.fromMap(resData);
        }
        isLoadedRecipe = true;
        update();
      }
    });
    return result;
  }
}
