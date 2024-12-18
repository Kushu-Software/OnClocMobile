import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/main.dart';
import 'package:on_cloc_mobile/app/models/start/onboarding.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';


class OnClocOnboardingController extends GetxController {
  final PageController pageController = PageController();

  final _onboardings = [
    OnBoardingPage(
      text: language.lblOnBoardingTitleSlide1,
      image: Get.isDarkMode ? obDark1 : ob_1,
      description: language.lblOnBoardingDescriptionSlide1,
    ),
    OnBoardingPage(
      text: language.lblOnBoardingTitleSlide2,
      image: Get.isDarkMode ? obDark2 : ob_2,
      description: language.lblOnBoardingDescriptionSlide2,
    ),
    OnBoardingPage(
      text: language.lblOnBoardingTitleSlide3,
      image: Get.isDarkMode ? obDark3 : obLight3,
      description: language.lblOnBoardingDescriptionSlide3,
    ),
  ];

  List<OnBoardingPage> get walkthroughs => _onboardings;

  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  set currentIndex(int value) => _currentIndex.value = value;

  void nextPage() {
    if (currentIndex < walkthroughs.length - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      goToLoginScreen();
    }
  }

  void goToLoginScreen() {
    Get.toNamed(OnClocRoutes.onClocLoginScreen);
  }
}
