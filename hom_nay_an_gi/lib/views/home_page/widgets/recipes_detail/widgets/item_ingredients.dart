// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class ItemIngredients extends StatelessWidget {
  final String name;
  final String mentsure;
  final String mentsureUnit;
  final String image;
  const ItemIngredients({
    Key? key,
    required this.name,
    required this.mentsure,
    required this.mentsureUnit,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimensions.widthPadding10, bottom: Dimensions.widthPadding10),
      child: Row(
        children: [
          Container(
            width: Dimensions.widthPadding40 + 10,
            height: Dimensions.widthPadding40 + 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius50),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.widthPadding15,
          ),
          BigText(
            text: mentsure,
            color: AppColors.mainBlackColor,
          ),
          SizedBox(
            width: Dimensions.widthPadding5,
          ),
          BigText(
            text: mentsureUnit,
            color: AppColors.mainBlackColor,
          ),
          SizedBox(
            width: Dimensions.widthPadding5,
          ),
          SmallText(
            text: name,
            color: AppColors.mainBlackColor,
          ),
        ],
      ),
    );
  }
}
