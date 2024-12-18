import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/app/controllers/start/splash.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';

class OnClocSplashScreen extends StatefulWidget {
  static String tag = '/OnClocSplashScreen';
  const OnClocSplashScreen({super.key});

  @override
  OnClocSplashScreenState createState() => OnClocSplashScreenState();
}

class OnClocSplashScreenState extends State<OnClocSplashScreen> {
  OnClocSplashController controller = Get.put(OnClocSplashController());

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
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocSplashController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(splashBg),
                  fit: BoxFit
                      .fill, // This ensures that the image covers the entire container
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  appLogoWhite,
                  height: 64,
                  width: 64,
                ),
              ),
            ),
          );
        });
  }
}
