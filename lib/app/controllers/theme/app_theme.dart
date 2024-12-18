import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnClocThemeController extends GetxController {
  final _isDarkModeOn = false.obs;

  bool get isDarkMode => _isDarkModeOn.value;

  @override
  void onInit() {
    _loadTheme();
    updateSystemUiOverlayStyle();
    super.onInit();
  }

  void _loadTheme() async {
    final box = GetStorage();
    if (box.hasData('isDarkMode')) {
      _isDarkModeOn.value = box.read('isDarkMode');
    }
  }

  void toggleTheme() {
    _isDarkModeOn.value = !_isDarkModeOn.value;
    final box = GetStorage();
    box.write('isDarkMode', _isDarkModeOn.value);
    updateSystemUiOverlayStyle();
    Get.forceAppUpdate();
  }

  void updateSystemUiOverlayStyle() {
    SystemUiOverlayStyle systemUiOverlayStyle = _isDarkModeOn.value
        ? SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          )
        : SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          );

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}