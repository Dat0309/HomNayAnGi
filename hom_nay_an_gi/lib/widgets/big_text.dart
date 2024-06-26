// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String? text;
  final double? size;
  final TextOverflow? textOverflow;

  const BigText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimensions.heightPadding20 : size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
