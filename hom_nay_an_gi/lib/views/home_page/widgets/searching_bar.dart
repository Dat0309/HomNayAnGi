import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';

class SearchingBar extends StatefulWidget {
  const SearchingBar({super.key});

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthPadding25),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.signColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.widthPadding10,
                    ),
                    child: SizedBox(
                      height: Dimensions.heightPadding45 + 10,
                      child: Image.asset(
                        'assets/icons/search.png',
                        color: AppColors.titleColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tìm kiếm công thức',
                        hintStyle: TextStyle(
                          color: AppColors.titleColor,
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.widthPadding15,
          ),
          Container(
            height: Dimensions.heightPadding45 + 10,
            width: Dimensions.heightPadding45 + 10,
            decoration: BoxDecoration(
              color: AppColors.signColor,
              borderRadius: BorderRadius.circular(Dimensions.radius15),
            ),
            child: Image.asset('assets/icons/option.png'),
          ),
        ],
      ),
    );
  }
}
