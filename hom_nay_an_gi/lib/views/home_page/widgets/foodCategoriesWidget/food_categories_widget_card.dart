import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class FoodCategoriesWidgetCard extends StatefulWidget {
  final String name;
  final String catId;
  final String image;

  const FoodCategoriesWidgetCard({
    super.key,
    required this.name,
    required this.catId,
    required this.image,
  });

  @override
  State<FoodCategoriesWidgetCard> createState() =>
      _FoodCategoriesWidgetCardState();
}

class _FoodCategoriesWidgetCardState extends State<FoodCategoriesWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.widthPadding15),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.widthPadding60,
              height: Dimensions.widthPadding60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius50),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor!,
                      blurRadius: 5.0,
                      offset: const Offset(0, 5),
                    )
                  ],
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: Dimensions.heightPadding10,
            ),
            SizedBox(
              width: Dimensions.widthPadding60,
              child: SmallText(
                text: widget.name,
                size: Dimensions.font16,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
