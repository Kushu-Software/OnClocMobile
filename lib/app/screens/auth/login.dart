import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:on_cloc_mobile/app/controllers/auth/login.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/widgets/button_common_widget.dart';
import 'package:on_cloc_mobile/widgets/text_custom_widget.dart';

class OnClocLoginScreen extends StatefulWidget {
  static String tag = '/OnClocLoginScreen';
  const OnClocLoginScreen({super.key});

  @override
  OnClocLoginScreenState createState() => OnClocLoginScreenState();
}

class OnClocLoginScreenState extends State<OnClocLoginScreen> {
  OnClocLoginController controller = Get.put(OnClocLoginController());
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
    return GetBuilder<OnClocLoginController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(
                    bottom: GetPlatform.isIOS
                        ? MediaQuery.of(context).padding.bottom
                        : 20.0),
                child: InkWell(
                  onTap: () {
                    //controller.goToSignUp();
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: appPoweredBy,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w300),
                      children: [
                        TextSpan(
                          text: kushuSoftware,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              color: appColorPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.height,
                        SvgPicture.asset(
                          appLogo,
                          width: 100,
                          height: 67,
                        ),
                        25.height,
                        Text(
                          welcomeBack,
                          style: theme.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          toHrAttendee,
                          style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: appColorPrimary),
                        ),
                        8.height,
                        Text(
                          loginToContinue,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300, color: appGreyColor),
                        ),
                        30.height,
                        /*Obx(()=>*/ OutlineBorderTextFormField(
                          labelText: emailAddress,
                          myFocusNode: controller.f1,
                          tempTextEditingController: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          checkOfErrorOnFocusChange: true,
                          inputFormatters: const [],
                          validation: (textToValidate) {
                            return controller.validateEmail(textToValidate);
                          },
                          theme: theme,
                        ),
                        // ),
                        20.height,
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
                                      Get.isDarkMode
                                          ? Colors.white
                                          : appIconColor,
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                            labelText: password,
                            // suffixIcon: eyeSlashIcon,
                            prefixIconColor: Get.isDarkMode
                                ? Colors.white
                                : appTextColorPrimary,
                            myFocusNode: controller.f2,
                            tempTextEditingController:
                                controller.passwordController,
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
                              return controller
                                  .getPasswordValidation(textToValidate);
                            },
                            theme: theme,
                          ),
                        ),
                        10.height,
                        InkWell(
                          focusColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.toNamed(
                                OnClocRoutes.onClocForgotPasswordScreen);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              forgotPassword,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: appColorPrimary),
                            ),
                          ),
                        ),
                        20.height,
                        Obx(
                          () => OnClocCommonButton(
                            bgColor: (controller.isEmailEnabled.value &&
                                    controller.isPasswordEnabled.value)
                                ? appColorPrimary
                                : appGreyColor.withOpacity(0.20),
                            textColor: (controller.isEmailEnabled.value &&
                                    controller.isPasswordEnabled.value)
                                ? Colors.white
                                : Get.isDarkMode
                                    ? Colors.white
                                    : appTextColorPrimary,
                            onPressed: () async {
                              if ((controller.isEmailEnabled.value &&
                                  controller.isPasswordEnabled.value)) {
                                Get.offNamedUntil(
                                  OnClocRoutes.onClocNavigationScreen,
                                  (route) => route.isFirst,
                                );
                              }
                            },
                            text: login,
                          ),
                        ),
                        20.height,
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
