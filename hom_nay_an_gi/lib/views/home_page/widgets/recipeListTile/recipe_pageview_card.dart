// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/models/Recipe.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';

class RecipePageViewCard extends StatelessWidget {
  final bool? active;
  final int? index;
  final Recipe? recipe;
  const RecipePageViewCard({
    Key? key,
    this.active,
    this.index,
    this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double blur = active! ? 16 : 0;
    final double offset = active! ? 4 : 0;
    final double top = active! ? 0 : 46;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(
        top: top,
        bottom: 0,
        right: 15.5,
        left: active! ? 32.5 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius30 + 2),
        color: AppColors.primaryBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            blurRadius: blur,
            offset: Offset(0, offset),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(recipe!.image!),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30 + 2),
                gradient: LinearGradient(
                    colors: [
                      AppColors.primaryColor!.withOpacity(0.9),
                      AppColors.primaryColor!.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    tileMode: TileMode.clamp,
                    stops: const [0.3, 0.6])),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.widthPadding25,
                right: Dimensions.widthPadding17,
                top: Dimensions.heightPadding10,
              ),
              height: Dimensions.heightPadding60 + 32,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor!.withOpacity(0.0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radius30 + 2),
                    bottomRight: Radius.circular(Dimensions.radius30 + 2),
                  )),
              child: Text(
                recipe!.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: Dimensions.font16 + 2,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Dimensions.heightPadding60 + 30,
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.widthPadding17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.widthPadding10,
                      vertical: Dimensions.widthPadding5,
                    ),
                    height: Dimensions.widthPadding30,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius15 - 2),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Công thức',
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/icons/save.png'),
                    ],
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
