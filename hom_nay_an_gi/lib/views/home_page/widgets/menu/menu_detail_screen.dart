// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/models/Menu.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/menu/widgets/wiget_menu_recipe.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/recipe_detail_screen.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';
import 'package:hom_nay_an_gi/widgets/widget_button.dart';

class MenuDetailScreen extends StatefulWidget {
  final Menu menu;
  const MenuDetailScreen({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimensions.screenWidth,
        height: Dimensions.screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.menu.thumb!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.5),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.widthPadding20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.heightPadding45,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: widget.menu.title,
                        color: AppColors.primaryBgColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding30,
                      ),
                      SmallText(
                        text: widget.menu.description,
                        color: AppColors.primaryBgColor,
                        textOverflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      SmallText(
                        text:
                            '${widget.menu.recipes!.length.toString()} Công thức',
                        color: AppColors.secondaryColor,
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding10,
                      ),
                      Container(
                        height: Dimensions.height220,
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          right: Dimensions.widthPadding25,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.menu.recipes!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => RecipeDetailScreen(
                                      recipeId: widget.menu.recipes![index]
                                          ['recipe_id'],
                                    ));
                              },
                              child: MenuRecipeWidgetCard(
                                  name: widget.menu.recipes![index]['name']!,
                                  image: widget.menu.recipes![index]['image']!),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.heightPadding30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: WidgetButton(
                            text: 'Quay lại',
                            color: AppColors.primaryColors,
                            textColor: AppColors.primaryBgColor!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
