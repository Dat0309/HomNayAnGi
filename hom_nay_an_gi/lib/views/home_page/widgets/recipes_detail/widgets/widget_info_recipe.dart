// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/app_icon.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class WifgetInfoRecipe extends StatelessWidget {
  final String name;
  final IconData icon;
  final String value;

  const WifgetInfoRecipe({
    Key? key,
    required this.name,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.widthPadding10),
      child: Container(
        padding: EdgeInsets.all(Dimensions.widthPadding10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius50),
        ),
        child: Column(
          children: [
            AppIcon(
              icon: icon,
              backgroundColor: AppColors.primaryBgColor,
              iconColor: AppColors.mainBlackColor,
            ),
            BigText(
              text: value,
              color: AppColors.mainBlackColor,
              size: Dimensions.font16 + 2,
            ),
            SmallText(
              text: name,
              color: AppColors.mainBlackColor,
              size: Dimensions.font16 - 5,
            ),
          ],
        ),
      ),
    );
  }
}
