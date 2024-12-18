import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:on_cloc_mobile/app/controllers/auth/reset_password.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';
import 'package:on_cloc_mobile/widgets/button_common_widget.dart';
import 'package:on_cloc_mobile/widgets/text_custom_widget.dart';

class OnClocResetPasswordScreen extends StatefulWidget {
  const OnClocResetPasswordScreen({super.key});

  @override
  OnClocResetPasswordScreenState createState() => OnClocResetPasswordScreenState();
}

class OnClocResetPasswordScreenState extends State<OnClocResetPasswordScreen> {
  OnClocResetPasswordController controller = Get.put(OnClocResetPasswordController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode 
    ? OnClocTheme.onClocDarkTheme 
    : OnClocTheme.onClocLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnClocResetPasswordController>(
        init: controller,
        tag: 'on_cloc_reset_password',
        builder: (controller) {
          return Scaffold(
            appBar: onClocCommonAppBarWidget(context),
            backgroundColor: theme.scaffoldBackgroundColor,
            bottomNavigationBar: Obx(
              () => Padding(
                padding: EdgeInsets.only(
                    left: 20,top: 15,right: 20,
                    bottom: GetPlatform.isIOS
                        ? MediaQuery.of(context).padding.bottom
                        : 20.0),
                child: OnClocCommonButton(
                  bgColor: (controller.isFormValid())
                      ? appColorPrimary
                      : appGreyColor.withOpacity(0.20),
                  textColor: (controller.isFormValid())
                      ? Colors.white
                      : Get.isDarkMode ? Colors.white : appTextColorPrimary,
                  onPressed: () async {
                    if ((controller.isFormValid())) {
                      Get.toNamed(OnClocRoutes.onClocNavigationScreen);
                    }
                  },
                  text: updatePassword,
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      enterNewPassword,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    8.height,
                    Text(
                      enterYourNewPassword,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300, color: appGreyColor),
                    ),
                    30.height,
                    Center(
                      child: SvgPicture.asset(
                        Get.isDarkMode ? resetPassBgDark : resetPassBgLight,
                        width: 260,
                        height: 257,
                      ),
                    ),
                    30.height,
                    Obx(
                      () => OutlineBorderTextFormField(
                        obscureText: controller.isIconTrue.value,
                        suffixIcon: Theme(
                          data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent),
                          child: IconButton(
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              controller.isIconTrue.value =
                                  !controller.isIconTrue.value;
                            },
                            icon: SvgPicture.asset(
                              (controller.isIconTrue.value)
                                  ? eyeIcon
                                  : eyeSlashIcon,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                  Get.isDarkMode ? Colors.white : appIconColor,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        labelText: password,
                        // suffixIcon: eyeSlashIcon,
                        prefixIconColor:
                            Get.isDarkMode ? Colors.white : appTextColorPrimary,
                        myFocusNode: controller.f1,
                        tempTextEditingController:
                            controller.passwordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autofocus: false,
                        checkOfErrorOnFocusChange: true,
                        inputFormatters: [
                          // Use TextInputFormatter to apply formatting rules
                          LengthLimitingTextInputFormatter(20),
                          // Limit the length to 20 characters
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9@!#$%&*_-]+')),
                          // Allow only specified characters
                          // Accept only digits (numeric input)
                        ],
                        validation: (textToValidate) {
                          return controller.validatePassword(textToValidate);
                        },
                        theme: theme,
                      ),
                    ),
                    20.height,
                    Obx(
                      () => OutlineBorderTextFormField(
                        obscureText: controller.isConIconTrue.value,
                        suffixIcon: Theme(
                          data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent),
                          child: IconButton(
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              controller.isConIconTrue.value =
                                  !controller.isConIconTrue.value;
                            },
                            icon: SvgPicture.asset(
                              (controller.isConIconTrue.value)
                                  ? eyeIcon
                                  : eyeSlashIcon,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                  Get.isDarkMode ? Colors.white : appIconColor,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        labelText: reEnterNewPassword,
                        // suffixIcon: eyeSlashIcon,
                        prefixIconColor:
                            Get.isDarkMode ? Colors.white : appTextColorPrimary,
                        myFocusNode: controller.f2,
                        tempTextEditingController:
                            controller.confirmPasswordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        autofocus: false,
                        checkOfErrorOnFocusChange: true,
                        inputFormatters: [
                          // Use TextInputFormatter to apply formatting rules
                          LengthLimitingTextInputFormatter(20),
                          // Limit the length to 20 characters
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9@!#$%&*_-]+')),
                          // Allow only specified characters
                          // Accept only digits (numeric input)
                        ],
                        validation: (textToValidate) {
                          return controller.validateConfirmPassword(
                              controller.passwordController.text,
                              textToValidate);
                        },
                        theme: theme,
                      ),
                    ),
                    20.height,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
