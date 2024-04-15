// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';

class MenuRecipeWidgetCard extends StatefulWidget {
  final String name;
  final String image;

  const MenuRecipeWidgetCard({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<MenuRecipeWidgetCard> createState() => _MenuRecipeWidgetCardState();
}

class _MenuRecipeWidgetCardState extends State<MenuRecipeWidgetCard> {
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
              Container(
                padding: EdgeInsets.all(Dimensions.widthPadding10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.primaryBgColor!.withOpacity(.5)),
                child: BigText(
                  text: widget.name,
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
