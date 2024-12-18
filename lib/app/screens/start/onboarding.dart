import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/start/onboarding.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';
import 'package:on_cloc_mobile/widgets/button_common.dart';

class OnClocOnboardingScreen extends StatefulWidget {
  static String tag = '/OnClocOnboardingScreen';
  const OnClocOnboardingScreen({super.key});

  @override
  OnClocOnboardingScreenState createState() => OnClocOnboardingScreenState();
}

class OnClocOnboardingScreenState extends State<OnClocOnboardingScreen> {
  final OnClocOnboardingController controller =
      Get.put(OnClocOnboardingController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode
        ? OnClocTheme.onClocDarkTheme
        : OnClocTheme.onClocLightTheme;
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              // Assign PageController
              controller: controller.pageController,
              itemCount: controller.walkthroughs.length,
              onPageChanged: (index) {
                controller.currentIndex = index;
              },
              itemBuilder: (context, index) {
                final walkthrough = controller.walkthroughs[index];
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        color: appColorPrimary.withValues(),
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                walkthrough.image,
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            100.height
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? appDarkColorPrimary
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: controller.walkthroughs.length,
                                position: controller.currentIndex.toInt(),
                                decorator: DotsDecorator(
                                  activeColor: appColorPrimary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  activeSize: const Size(50.0, 4.0),
                                  size: const Size(10.0, 4.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                              ),
                            ),
                            15.height,
                            Text(
                              walkthrough.text,
                              style: theme.textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            15.height,
                            Text(
                              walkthrough.description,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : appGreyColor),
                              textAlign: TextAlign.center,
                            ),
                            20.height,
                            Obx(
                              () => OnClocCommonButton(
                                onPressed: () {
                                  controller.nextPage();
                                },
                                text: (controller.currentIndex <
                                        controller.walkthroughs.length - 1)
                                    ? next
                                    : getStarted,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingView extends StatelessWidget {
  final String text;
  final String image;
  final ThemeData theme;

  const OnBoardingView(
      {super.key,
      required this.text,
      required this.image,
      required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: onClocCommonCacheImageWidget(
            image,
            MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
        ),
        30.height,
        Html(
          data: text,
        ),
        20.height,
      ],
    );
  }
}
