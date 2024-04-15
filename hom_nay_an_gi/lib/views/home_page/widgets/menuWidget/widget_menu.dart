import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/constant/colors.dart';
import 'package:hom_nay_an_gi/controllers/menu_controller.dart' as MC;
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/menu/menu_detail_screen.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/menuWidget/menu_widget_card.dart';
import 'package:hom_nay_an_gi/widgets/big_text.dart';
import 'package:hom_nay_an_gi/widgets/small_text.dart';
import 'package:shimmer/shimmer.dart';

class WidgetMenu extends StatefulWidget {
  const WidgetMenu({super.key});

  @override
  State<WidgetMenu> createState() => _WidgetMenuState();
}

class _WidgetMenuState extends State<WidgetMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.widthPadding15),
      child: Column(
        children: [
          GetBuilder<MC.MenuController>(builder: (menuController) {
            return menuController.isLoaded
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          bottom: Dimensions.heightPadding10,
                          right: Dimensions.widthPadding25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BigText(text: 'Thực đơn hôm nay'),
                            GestureDetector(
                              onTap: () {},
                              child: const SmallText(
                                text: 'Xem tất cả',
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.widthPadding25,
                          right: Dimensions.widthPadding25,
                        ),
                        height: Dimensions.height140 + 40,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => MenuDetailScreen(
                                    menu: menuController.menues[index]));
                              },
                              child: MenuWidgetCard(
                                title: menuController.menues[index].title,
                                description:
                                    menuController.menues[index].description,
                                image: menuController.menues[index].thumb,
                                countRecipe:
                                    menuController.menues[index].recipes.length,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const VerticalDivider(
                            color: Colors.transparent,
                            width: 5,
                          ),
                          itemCount: menuController.menues.length,
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.widthPadding10,
                      right: Dimensions.widthPadding10,
                    ),
                    height: Dimensions.heightPadding60,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: Dimensions.widthPadding300 + 65,
                                    height: Dimensions.height140 - 50,
                                    padding: EdgeInsets.all(
                                        Dimensions.widthPadding10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Dimensions.radius50)),
                                      color: AppColors.signColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const VerticalDivider(
                              color: Colors.transparent,
                              width: 5,
                            ),
                        itemCount: 10),
                  );
          })
        ],
      ),
    );
  }
}
