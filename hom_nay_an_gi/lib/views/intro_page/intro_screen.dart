import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/helpers/asset_helper.dart';
import 'package:hom_nay_an_gi/helpers/local_storage_helper.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/navigation.dart';
import 'package:hom_nay_an_gi/views/intro_page/widgets/ItemIntroWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/colors.dart';
import '../../constant/textstyle_constant.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    const ItemIntroWidget(
      title: 'Ngon miệng',
      description:
          'Bạn đang suy nghĩ đến một món ăn ngon, phải không? Làm ngay thôi!',
      sourceImage: AssetHelper.intro1,
      aligment: Alignment.centerRight,
    ),
    const ItemIntroWidget(
      title: 'Khoẻ mạnh',
      description:
          'Những công thức món ăn lành mạnh cho bạn và gia đình. Bảo vệ sức khoẻ gia đình bạn.',
      sourceImage: AssetHelper.intro2,
      aligment: Alignment.center,
    ),
    const ItemIntroWidget(
      title: 'Chúc ngon miệng!',
      description:
          'Khám phá những món ăn mới thật đơn giản và bạn có thể dễ dàng chia sẻ chúng với bạn bè của mình.',
      sourceImage: AssetHelper.intro3,
      aligment: Alignment.centerLeft,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: Dimensions.widthPadding25 - 1,
            right: Dimensions.widthPadding25 - 1,
            bottom: (Dimensions.widthPadding25 - 1) * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotWidth: Dimensions.widthPadding5,
                    dotHeight: Dimensions.widthPadding5,
                    activeDotColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      LocalSrorageHelper.setValue('ignoreIntroScreen', true);
                      Get.off(const NavigationPage());
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Dimensions.widthPadding25 - 1),
                        gradient: Gradients.defualtGradientBg),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widthPadding25 * 2,
                        vertical: Dimensions.widthPadding15 + 1),
                    child: StreamBuilder<int>(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != 2 ? 'Tiếp' : 'Bắt đầu',
                          style: TextStyles.defaultStyle.whiteTextColor.bold,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
