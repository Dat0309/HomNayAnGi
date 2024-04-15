import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/controllers/user_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class AppQuote extends StatefulWidget {
  const AppQuote({super.key});

  @override
  State<AppQuote> createState() => _AppQuoteState();
}

class _AppQuoteState extends State<AppQuote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.widthPadding25,
        right: Dimensions.widthPadding25,
        bottom: Dimensions.heightPadding20,
      ),
      child: GetBuilder<UserController>(builder: (user) {
        return user.isLoadedProfile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: 'Chào ${user.profile!.firstname!},'),
                  const BigText(text: 'Hôm nay ăn gì đây?'),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: 'Chào bạn,',
                    size: Dimensions.font24,
                  ),
                  BigText(
                    text: 'Hôm nay ăn gì đây?',
                    size: Dimensions.font32,
                  ),
                ],
              );
      }),
    );
  }
}
