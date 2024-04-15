import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/foodRecommendWidget/food_recommend_widget_card.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/recipe_detail_screen.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class WidgetFoodRecommend extends StatefulWidget {
  const WidgetFoodRecommend({super.key});

  @override
  State<WidgetFoodRecommend> createState() => _WidgetFoodRecommendState();
}

class _WidgetFoodRecommendState extends State<WidgetFoodRecommend> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.widthPadding15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GetBuilder<RecipeController>(builder: (recipeController) {
            return recipeController.isLoaded
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          bottom: Dimensions.heightPadding10,
                          right: Dimensions.widthPadding25,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: 'Món ăn hôm nay'),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.widthPadding25,
                            right: Dimensions.widthPadding25,
                          ),
                          height: Dimensions.height1000,
                          child: StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: recipeController.recipeRecomment.length,
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.count((index % 7 == 0) ? 2 : 2,
                                    (index % 7 == 0) ? 3 : 3.5),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Get.to(() => RecipeDetailScreen(
                                    recipeId: recipeController
                                        .recipeRecomment[index].id));
                              },
                              child: FoodRecommendWidgetCard(
                                  name: recipeController
                                      .recipeRecomment[index].title,
                                  cookTime: recipeController
                                      .recipeRecomment[index].cookTime,
                                  cookUnit: recipeController
                                      .recipeRecomment[index].cookTimeUnit,
                                  image: recipeController
                                      .recipeRecomment[index].image),
                            ),
                            crossAxisCount: 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          )),
                    ],
                  )
                : Container();
          }),
          SizedBox(
            height: Dimensions.height200,
          ),
          Container(
            width: Dimensions.widthPadding300,
            height: Dimensions.heightPadding60,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: 'Xem thêm công thức hôm nay',
                    color: AppColors.primaryColor,
                  ),
                  Icon(
                    Icons.more_horiz_rounded,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
