// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class MenuWidgetCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final int countRecipe;
  const MenuWidgetCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.countRecipe,
  }) : super(key: key);

  @override
  State<MenuWidgetCard> createState() => _MenuWidgetCardState();
}

class _MenuWidgetCardState extends State<MenuWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Dimensions.widthPadding300 + 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55),
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
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(Dimensions.widthPadding15),
          width: Dimensions.widthPadding300 + 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: widget.title,
                color: AppColors.primaryBgColor,
              ),
              SmallText(
                text: widget.description,
                color: AppColors.primaryBgColor,
                textOverflow: TextOverflow.visible,
              ),
              SmallText(
                text: '${widget.countRecipe} Công thức',
                color: AppColors.primaryBgColor,
                size: Dimensions.font16 + 3,
              )
            ],
          ),
        ),
      ],
    );
  }
}
