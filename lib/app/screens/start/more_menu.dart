import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';

class OnClocMoreMenuScreen extends StatefulWidget {
  static String tag = '/OnClocMoreMenuScreen';
  const OnClocMoreMenuScreen({super.key});

  @override
  OnClocMoreMenuScreenState createState() => OnClocMoreMenuScreenState();
}

class OnClocMoreMenuScreenState extends State<OnClocMoreMenuScreen> {

  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    theme = Get.isDarkMode
        ? OnClocTheme.onClocDarkTheme
        : OnClocTheme.onClocLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}