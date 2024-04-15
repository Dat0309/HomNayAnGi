// ignore_for_file: constant_identifier_names, prefer_interpolation_to_compose_strings

class AppUrl {
  static const int APP_VERSION = 1;
  static const String BASEURL = "https://backend-recipe.vercel.app/api/v1/";

  static const String FOODS = BASEURL + "food";
  static const String ADMIN_GET_ALL_FOOD = FOODS + "/all";
  static const String FOODS_BY_CATEGORIES = FOODS + "/category-id/";

  static const String CATEGORIES = BASEURL + "categories";
  static const String ADMIN_GET_ALL_CATEGORIES = CATEGORIES + "/all";

  static const String FOOD_CATEGORIES = BASEURL + "food-categories";
  static const String ADMIN_GET_ALL_FOOD_CATEGORIES = FOOD_CATEGORIES + "/all";

  static const String MENUES = BASEURL + "menu";
  static const String ADMIN_GET_ALL_MENU = MENUES + "/all";

  static const String USERS = BASEURL + "user";
  static const String LOGIN = USERS + "/login";
  static const String REGISTER = USERS;
  static const String PROFILE = USERS + "/profile";

  static const String RECIPES = BASEURL + "recipe";
  static const String ADMIN_GET_ALL_RECIPES = RECIPES + "/all";
  static const String RECOMMENT_RECIPES = RECIPES + "/recomment";
  static const String GET_RECIPE_BY_CATEGORIES = RECIPES + "/category-id/";
  static const String GET_RECIPE_BY_INGREDIENT = RECIPES + "/ingredient/name";
}
