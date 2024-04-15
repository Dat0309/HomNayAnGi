import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/favorite_page/favorite_page.dart';
import 'package:hom_nay_an_gi/views/home_page/home_page.dart';
import 'package:hom_nay_an_gi/views/notification_page/notificarion_page.dart';
import 'package:hom_nay_an_gi/views/profile_page/profile_page.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  var curIndex = 0;
  List pages = [
    const HomePage(),
    const FavoritePage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  List<String> listOfNamePages = [
    'Trang chủ',
    'Yêu thích',
    'Thông báo',
    'Tài khoản',
  ];

  List<IconData> lisOfIconsPages = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.notifications_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      body: SafeArea(
        child: pages[curIndex],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimensions.screenWidth * .05),
        height: 85,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius30),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.screenWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                curIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == curIndex
                      ? Dimensions.screenWidth * .32
                      : Dimensions.screenWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height:
                        index == curIndex ? Dimensions.screenWidth * .12 : 0,
                    width: index == curIndex ? Dimensions.screenWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == curIndex
                          ? AppColors.thirthColor
                          : AppColors.primaryBgColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == curIndex
                      ? Dimensions.screenWidth * .31
                      : Dimensions.screenWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == curIndex
                                ? Dimensions.screenWidth * .13
                                : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == curIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: index == curIndex
                                ? SmallText(
                                    text: listOfNamePages[index],
                                    color: AppColors.primaryColor,
                                  )
                                : const SmallText(text: ''),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == curIndex
                                ? Dimensions.screenWidth * .03
                                : 20,
                          ),
                          Icon(
                            lisOfIconsPages[index],
                            size: Dimensions.screenWidth * .076,
                            color: index == curIndex
                                ? AppColors.primaryColor
                                : AppColors.primaryBgColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
