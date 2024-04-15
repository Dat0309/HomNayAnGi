// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class FoodRecommendWidgetCard extends StatefulWidget {
  final String name;
  final int cookTime;
  final String cookUnit;
  final String image;
  const FoodRecommendWidgetCard({
    Key? key,
    required this.name,
    required this.cookTime,
    required this.cookUnit,
    required this.image,
  }) : super(key: key);

  @override
  State<FoodRecommendWidgetCard> createState() =>
      _FoodRecommendWidgetCardState();
}

class _FoodRecommendWidgetCardState extends State<FoodRecommendWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (Dimensions.widthPadding300 + 65) / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                AppColors.mainBlackColor!.withOpacity(0.55),
                BlendMode.multiply,
              ),
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.image,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor!,
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.widthPadding10,
            right: Dimensions.widthPadding10,
            bottom: Dimensions.widthPadding10,
          ),
          width: (Dimensions.widthPadding300 + 65) / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: widget.name,
                color: AppColors.primaryBgColor,
                size: Dimensions.font16 + 3,
              ),
              SizedBox(
                height: Dimensions.widthPadding10,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.widthPadding10),
                decoration: BoxDecoration(
                  color: AppColors.primaryBgColor!.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                child: SmallText(
                  text: '${widget.cookTime} ${widget.cookUnit}',
                  color: AppColors.primaryBgColor,
                  size: Dimensions.font16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
