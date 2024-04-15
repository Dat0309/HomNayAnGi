// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/controllers/user_controller.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/app_quote.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/categoriesWidget/widgetCategories.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/foodCategoriesWidget/widget_ingredient.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/foodRecommendWidget/widget_recommend_food.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/menuWidget/widget_menu.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipeListTile/pageview_recipes.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/searching_bar.dart';
import 'package:hom_nay_an_gi/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().getProfile();
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AppBarCustom(),
            AppQuote(),
            SearchingBar(),
            PageviewRecipes(),
            WidgetCategories(),
            WidgetIngredient(),
            WidgetMenu(),
            WidgetFoodRecommend(),
          ],
        ),
      );
    });
  }
}
