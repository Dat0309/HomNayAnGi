import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/foodCategories_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/foodCategoriesWidget/food_categories_widget_card.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';
import 'package:shimmer/shimmer.dart';

class WidgetIngredient extends StatefulWidget {
  const WidgetIngredient({super.key});

  @override
  State<WidgetIngredient> createState() => _WidgetIngredientState();
}

class _WidgetIngredientState extends State<WidgetIngredient> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.widthPadding20),
      child: Column(
        children: [
          GetBuilder<FoodCategoriesController>(
              builder: (foodCategoriesController) {
            return foodCategoriesController.isLoaded
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
                            const BigText(text: 'Thành phần nguyên liệu'),
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
                        height: Dimensions.heightPadding45 + 40,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FoodCategoriesWidgetCard(
                              catId: foodCategoriesController
                                  .foodCategories[index].id,
                              name: foodCategoriesController
                                  .foodCategories[index].name,
                              image: foodCategoriesController
                                  .foodCategories[index].image,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                          itemCount:
                              foodCategoriesController.foodCategories.length,
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.widthPadding10,
                      right: Dimensions.widthPadding10,
                    ),
                    height: Dimensions.heightPadding60,
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
                                    width: Dimensions.widthPadding60,
                                    height: Dimensions.widthPadding60,
                                    padding: EdgeInsets.all(
                                        Dimensions.widthPadding10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius50)),
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
          })
        ],
      ),
    );
  }
}
