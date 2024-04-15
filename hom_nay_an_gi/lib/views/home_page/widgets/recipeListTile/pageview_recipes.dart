import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hom_nay_an_gi/controllers/recipe_controller.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipeListTile/recipe_pageview_card.dart';
import 'package:hom_nay_an_gi/views/home_page/widgets/recipes_detail/recipe_detail_screen.dart';

class PageviewRecipes extends StatefulWidget {
  const PageviewRecipes({super.key});

  @override
  State<PageviewRecipes> createState() => _PageviewRecipesState();
}

class _PageviewRecipesState extends State<PageviewRecipes> {
  final PageController pageController = PageController(viewportFraction: 0.75);

  int curPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(() {
      int position = pageController.page!.round();
      if (curPage != position) {
        {
          setState(() {
            curPage = position;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.widthPadding25,
        bottom: Dimensions.widthPadding25,
      ),
      child: GetBuilder<RecipeController>(builder: (recipeController) {
        return recipeController.isLoaded
            ? SizedBox(
                height: Dimensions.height350 + 50,
                child: PageView.builder(
                  padEnds: false,
                  controller: pageController,
                  itemCount: recipeController.recipes.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    bool active = index == curPage;
                    return Opacity(
                      opacity: curPage == index ? 1.0 : 0.5,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => RecipeDetailScreen(
                              recipeId: recipeController.recipes[index].id));
                        },
                        child: RecipePageViewCard(
                          active: active,
                          index: index,
                          recipe: recipeController.recipes[index],
                        ),
                      ),
                    );
                  },
                ),
              )
            : SizedBox();
      }),
    );
  }
}
