import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hom_nay_an_gi/helpers/local_storage_helper.dart';
import 'package:hom_nay_an_gi/utils/dimensions.dart';
import 'package:hom_nay_an_gi/views/home_page/navigation.dart';
import 'package:hom_nay_an_gi/views/intro_page/intro_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../../constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ignoreIntroScreen =
      LocalSrorageHelper.getValues('ignoreIntroScreen') as bool?;
  @override
  void initState() {
    super.initState();
    // redirectIntroScreen();
  }

  // void redirectIntroScreen() async {
  //   final ignoreIntroScreen =
  //       LocalSrorageHelper.getValues('ignoreIntroScreen') as bool?;
  //   await Future.delayed(const Duration(milliseconds: 3000));

  //   if (ignoreIntroScreen != null && ignoreIntroScreen) {
  //     // ignore: use_build_context_synchronously
  //     //Navigator.of(context).pushNamed(MainApp.routeName);
  //     Get.off(const NavigationPage());
  //   } else {
  //     LocalSrorageHelper.setValue('ignoreIntroScreen', true);
  //     // ignore: use_build_context_synchronously
  //     //Navigator.of(context).pushNamed(IntroScreen.routeName);
  //     Get.off(const IntroScreen());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      backgroundColor: AppColors.primaryBgColor!,
      splash: Lottie.asset('assets/images/splashscreen.json'),
      splashIconSize: Dimensions.screenHeight * 0.4,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      nextScreen: ignoreIntroScreen != null
          ? const NavigationPage()
          : const IntroScreen(),
    );
  }
}
