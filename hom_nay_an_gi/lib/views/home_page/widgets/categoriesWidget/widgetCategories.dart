import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/categories_controller.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/categoriesWidget/categories_widget_card.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipeListTile/recipe_list_tile.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/recipe_detail_screen.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';
import 'package:shimmer/shimmer.dart';

class WidgetCategories extends StatefulWidget {
  const WidgetCategories({super.key});

  @override
  State<WidgetCategories> createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.heightPadding15),
      child: Column(
        children: [
          GetBuilder<CategoriesController>(builder: (categoryController) {
            return categoryController.isLoaded
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          bottom: Dimensions.heightPadding10,
                          right: Dimensions.widthPadding25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BigText(text: 'Thực đơn theo bữa'),
                            GestureDetector(
                              onTap: () {},
                              child: const SmallText(
                                text: 'Xem tất cả',
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          right: Dimensions.widthPadding25,
                        ),
                        height: Dimensions.heightPadding45 + 10,
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoriesWidgetCard(
                                  catId:
                                      categoryController.categories[index].id,
                                  name: categoryController
                                      .categories[index].name);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                            itemCount: categoryController.categories.length),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.widthPadding10,
                      right: Dimensions.widthPadding10,
                    ),
                    height: Dimensions.heightPadding45,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: Dimensions.widthPadding100,
                                    height: Dimensions.heightPadding45,
                                    padding: EdgeInsets.all(
                                        Dimensions.widthPadding10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius30)),
                                      color: AppColors.signColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: 10),
                  );
          }),
          SizedBox(
            height: Dimensions.widthPadding25,
          ),
          GetBuilder<RecipeController>(builder: (recipeController) {
            return recipeController.isLoadedRecipeByCategories
                ? SizedBox(
                    height: Dimensions.height220 + 20,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => RecipeDetailScreen(
                                      recipeId: recipeController
                                          .recipeCategories[index].id));
                                },
                                child: RecipeListTile(
                                  image: recipeController
                                      .recipeCategories[index].image,
                                  rating: recipeController
                                      .recipeCategories[index].rating,
                                  recipeName: recipeController
                                      .recipeCategories[index].title,
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: recipeController.recipeCategories.length),
                  )
                : SizedBox(
                    height: Dimensions.height220 + 20,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: Dimensions.widthPadding25,
                                    ),
                                    child: Container(
                                      width: Dimensions.width140,
                                      height: Dimensions.height220,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius15),
                                        color: AppColors.signColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: 10),
                  );
          })
        ],
      ),
    );
  }
}
