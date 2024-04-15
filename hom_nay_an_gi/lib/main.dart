// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/auth_controller.dart';
import 'package:hom_nay_an_gi/controllers/categories_controller.dart';
import 'package:hom_nay_an_gi/controllers/foodCategories_controller.dart';
import 'package:hom_nay_an_gi/controllers/food_controller.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/controllers/user_controller.dart';
import 'package:hom_nay_an_gi/helpers/local_storage_helper.dart';
import 'package:hom_nay_an_gi/views/intro_page/splash_screen.dart';
import 'package:hom_nay_an_gi/controllers/menu_controller.dart'
    as MenuController;
import 'helpers/dependentcies.dart' as dep;

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await LocalSrorageHelper.initLocalStorageHelper();
  await dep.AppDependentcies.init();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<FoodController>().getFoods();
    Get.find<RecipeController>().getRecipes();
    Get.find<RecipeController>().getRecommentRecipes();
    Get.find<AuthController>();
    Get.find<CategoriesController>().getCategories();
    Get.find<FoodController>().getFoods();
    Get.find<FoodCategoriesController>().getFoodCategories();
    Get.find<MenuController.MenuController>().getMenues();
    Get.find<UserController>();
    return const GetMaterialApp(
      title: 'HÔM NAY ĂN GÌ?',
      debugShowCheckedModeBanner: false,
      color: AppColors.primaryBgColor,
      //home: NavigationPage(),
      home: SplashScreen(),
    );
  }
}
