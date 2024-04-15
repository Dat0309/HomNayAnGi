import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/models/Recipe.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/widgets/item_ingredients.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/widgets/widget_info_recipe.dart';
import 'package:hom_nay_an_gi/widgets/app_icon.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailScreen extends StatefulWidget {
  final String recipeId;
  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  Recipe? recipeById;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.recipeId != null) {
      Get.find<RecipeController>()
          .getRecipeById(widget.recipeId!)
          .then((value) {
        recipeById = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          parallaxEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20),
          ),
          padding: EdgeInsets.symmetric(horizontal: Dimensions.heightPadding15),
          minHeight: Dimensions.screenHeight / 2,
          maxHeight: Dimensions.screenHeight / 1.2,
          panel: Padding(
            padding: EdgeInsets.all(Dimensions.widthPadding15),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<RecipeController>(builder: (recipeController) {
                return recipeController.isLoadedRecipe
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: Dimensions.heightPadding8,
                              width: Dimensions.widthPadding100,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.mainBlackColor!.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Dimensions.widthPadding300,
                                    child: BigText(
                                      text: recipeById!.title,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: Dimensions.widthPadding40,
                                        height: Dimensions.widthPadding40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius50),
                                          border: Border.all(
                                              color: AppColors.primaryColor!),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                recipeById!.source!.image!),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.widthPadding10,
                                      ),
                                      SmallText(
                                        text: recipeById!.source!.name,
                                        size: Dimensions.font16,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding:
                                    EdgeInsets.all(Dimensions.widthPadding10),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.mainBlackColor,
                                      size: Dimensions.iconSize16,
                                    ),
                                    SmallText(
                                      text: recipeById!.rating.toString(),
                                      color: AppColors.mainBlackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WifgetInfoRecipe(
                                name: recipeById!.cookTimeUnit!,
                                icon: Icons.timelapse_outlined,
                                value: recipeById!.cookTime.toString(),
                              ),
                              WifgetInfoRecipe(
                                name: recipeById!.calories!.split(' ')[1],
                                icon: Icons.local_fire_department_outlined,
                                value: recipeById!.calories!.split(' ')[0],
                              ),
                              WifgetInfoRecipe(
                                name: 'Bình luận',
                                icon: Icons.rate_review,
                                value: recipeById!.numReview.toString(),
                              ),
                              WifgetInfoRecipe(
                                name: 'Độ khó',
                                icon: Icons.add_chart_outlined,
                                value: recipeById!.difficulty == 1
                                    ? 'Dễ'
                                    : recipeById!.difficulty == 2
                                        ? 'Vừa'
                                        : 'Khó',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Mô tả',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: SmallText(
                                text: recipeById!.description,
                                textOverflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Giá trị dinh dưỡng',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: SmallText(
                                text: recipeById!.yields,
                                textOverflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Trường hợp dị ứng',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: SmallText(
                                text: recipeById!.allergies,
                                textOverflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Nguyên liệu',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: recipeById!.ingredients!.length,
                                itemBuilder: ((context, index) {
                                  return ItemIngredients(
                                    name: recipeById!.ingredients![index]
                                        ['name'],
                                    mentsure: recipeById!.ingredients![index]
                                            ['measurement']
                                        .toString(),
                                    mentsureUnit: recipeById!
                                        .ingredients![index]['measure_unit'],
                                    image: recipeById!.ingredients![index]
                                        ['image'],
                                  );
                                })),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Chế biến',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: SmallText(
                                text: recipeById!.processing,
                                textOverflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Thực hiện',
                            color: AppColors.mainBlackColor,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: Dimensions.widthPadding10),
                            padding: EdgeInsets.all(Dimensions.widthPadding10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBgColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            child: SmallText(
                                text: recipeById!.instruction,
                                textOverflow: TextOverflow.visible),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          Center(
                            child: Container(
                              width: Dimensions.widthPadding300,
                              height: Dimensions.height120,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                image: DecorationImage(
                                  image: NetworkImage(recipeById!.image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Tham khảo các món ăn tương tự',
                            color: AppColors.mainBlackColor,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: Dimensions.heightPadding8,
                              width: Dimensions.widthPadding100,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.mainBlackColor!.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: Dimensions.widthPadding25,
                                      ),
                                      child: Container(
                                        width: Dimensions.widthPadding300 - 10,
                                        height: Dimensions.heightPadding15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: Dimensions.widthPadding25,
                                      ),
                                      child: Container(
                                        width: Dimensions.widthPadding60,
                                        height: Dimensions.heightPadding10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                          color: AppColors.signColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: Dimensions.widthPadding25,
                                  ),
                                  child: Container(
                                    width: Dimensions.widthPadding40 + 10,
                                    height: Dimensions.heightPadding30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius15),
                                      color: AppColors.signColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Giá trị dinh dưỡng',
                            color: AppColors.mainBlackColor,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Trường hợp dị ứng',
                            color: AppColors.mainBlackColor,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Nguyên liệu',
                            color: AppColors.mainBlackColor,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Chế biến',
                            color: AppColors.mainBlackColor,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Thực hiện',
                            color: AppColors.mainBlackColor,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: Dimensions.widthPadding300,
                                  height: Dimensions.height140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.heightPadding20,
                          ),
                          const BigText(
                            text: 'Tham khảo các món ăn tương tự',
                            color: AppColors.mainBlackColor,
                          ),
                        ],
                      );
              }),
            ),
          ),
          body: GetBuilder<RecipeController>(builder: (recipeController) {
            return recipeController.isLoadedRecipe
                ? SingleChildScrollView(
                    child: Stack(
                      children: [
                        Hero(
                          tag: recipeById!.image!,
                          child: ClipRRect(
                            child: Image(
                              width: double.infinity,
                              height: (Dimensions.screenHeight / 2) + 50,
                              fit: BoxFit.cover,
                              image: NetworkImage(recipeById!.image!),
                            ),
                          ),
                        ),
                        Positioned(
                            top: Dimensions.heightPadding30,
                            right: Dimensions.widthPadding20,
                            child: const AppIcon(icon: Icons.bookmark_outline)),
                        Positioned(
                          top: Dimensions.heightPadding30,
                          left: Dimensions.widthPadding20,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const AppIcon(
                              icon: Icons.arrow_back_ios_new_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'recipe image',
                          child: ClipRRect(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: Dimensions.widthPadding25,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: (Dimensions.screenHeight / 2) + 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: AppColors.signColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: Dimensions.heightPadding30,
                            right: Dimensions.widthPadding20,
                            child: const AppIcon(icon: Icons.bookmark_outline)),
                        Positioned(
                          top: Dimensions.heightPadding30,
                          left: Dimensions.widthPadding20,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const AppIcon(
                              icon: Icons.arrow_back_ios_new_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
