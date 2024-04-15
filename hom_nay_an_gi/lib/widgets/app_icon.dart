import 'package:flutter/cupertino.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  const AppIcon({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.primaryColor,
    this.iconColor = AppColors.secondaryColor,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? Dimensions.iconSize50 : size,
      height: size == 0 ? Dimensions.iconSize50 : size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            size == 0 ? Dimensions.iconSize50 / 2 : size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size == 0 ? Dimensions.iconSize24 : size,
      ),
    );
  }
}
