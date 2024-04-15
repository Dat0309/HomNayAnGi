// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class TextIcon extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color? textColor;
  final Color? iconColor;

  const TextIcon({
    Key? key,
    this.icon,
    this.text,
    this.textColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.widthPadding5,
        ),
        SmallText(
          text: text,
          color: textColor,
        ),
      ],
    );
  }
}
