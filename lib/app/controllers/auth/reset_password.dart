import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnClocResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();

  final formKey = GlobalKey<FormState>();

  RxBool isPasswordEnabled = false.obs;
  RxBool isConPasswordEnabled = false.obs;

  RxBool isIconTrue = true.obs;
  RxBool isConIconTrue = true.obs;

  String validatePassword(String text) {
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

  String validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      isConPasswordEnabled.value = false;
      return 'Please Re-Enter your password';
    }
    if (password != confirmPassword) {
      isConPasswordEnabled.value = false;
      return 'Passwords do not match';
    }

    isConPasswordEnabled.value = true;
    return '';
  }

  bool isFormValid() {
    return isPasswordEnabled.value && isConPasswordEnabled.value;
  }
}
