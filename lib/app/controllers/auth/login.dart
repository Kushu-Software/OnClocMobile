import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnClocLoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  final formKey = GlobalKey<FormState>();
  RxBool isPasswordEnabled = false.obs;
  RxBool isEmailEnabled = false.obs;
  RxBool isIconTrue = true.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      isEmailEnabled.value = false;
      return 'Please enter your email';
    }
    // Use regex for email validation
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      isEmailEnabled.value = false;
      return 'Please enter a valid email';
    }
    isEmailEnabled.value = true;
    return "";
  }


  String getPasswordValidation(String text) {
    if (text.isEmpty) {
      isPasswordEnabled.value = false;
      return 'Password is required';
    }
    if (text.length < 8) {
      isPasswordEnabled.value = false;
      return 'Password must be at least 8 characters long';
    }

    isPasswordEnabled.value = true;
    return "";
  }

  @override
  void onInit() {
    emailController.text = 'michael.mitc@example.com';
    passwordController.text = '12345678';
    isEmailEnabled.value = true;
    isPasswordEnabled.value = true;
    super.onInit();
  }
}
