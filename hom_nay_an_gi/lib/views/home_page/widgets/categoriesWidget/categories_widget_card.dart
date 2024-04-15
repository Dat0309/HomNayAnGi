import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class CategoriesWidgetCard extends StatefulWidget {
  final String name;
  final String catId;
  const CategoriesWidgetCard({
    super.key,
    required this.name,
    required this.catId,
  });

  @override
  State<CategoriesWidgetCard> createState() => _CategoriesWidgetCardState();
}

class _CategoriesWidgetCardState extends State<CategoriesWidgetCard> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        if (isActive) {
          Get.find<RecipeController>().getRecipeByCategories(widget.catId);
        }
      },
      child: Container(
        margin: EdgeInsets.all(Dimensions.widthPadding5),
        height: Dimensions.widthPadding40,
        decoration: BoxDecoration(
            gradient: isActive
                ? LinearGradient(
                    colors: [
                      AppColors.primaryColor!,
                      AppColors.primaryColor!.withOpacity(0.8),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    tileMode: TileMode.clamp,
                    stops: const [0.3, 0.6])
                : LinearGradient(
                    colors: [
                      AppColors.thirthColor!,
                      AppColors.thirthColor!,
                    ],
                  ),
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.radius20),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor!,
                blurRadius: 5.0,
                offset: const Offset(0, 5),
              )
            ]),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.radius15),
        child: Center(
          child: SmallText(
            text: widget.name,
            size: Dimensions.font16,
          ),
        ),
      ),
    );
  }
}
