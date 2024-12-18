import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/profile/forgot_password.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';
import 'package:on_cloc_mobile/widgets/button_common_widget.dart';
import 'package:on_cloc_mobile/widgets/text_custom_widget.dart';

class OnClocForgotPasswordScreen extends StatefulWidget {
  const OnClocForgotPasswordScreen({super.key});

  @override
  OnClocForgotPasswordScreenState createState() => OnClocForgotPasswordScreenState();
}

class OnClocForgotPasswordScreenState extends State<OnClocForgotPasswordScreen> {
  OnClocForgotPasswordController controller =
      Get.put(OnClocForgotPasswordController());
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
    return GetBuilder<OnClocForgotPasswordController>(
        init: controller,
        tag: 'on_cloc_forgot_password',
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
                  bgColor: (controller.isEmailEnabled.value)
                      ? appColorPrimary
                      : appGreyColor.withOpacity(0.20),
                  textColor: (controller.isEmailEnabled.value)
                      ? Colors.white
                      : Get.isDarkMode ? Colors.white : appTextColorPrimary,
                  onPressed: () async {
                    if ((controller.isEmailEnabled.value)) {
                      Get.toNamed(OnClocRoutes.onClocOtpVerificationScreen);
                    }
                  },
                  text: continueText,
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
                      forgotPasswordWithEmoji,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    8.height,
                    Text(
                      selectContactDetailsToResetPassword,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300, color: appGreyColor),
                    ),
                    30.height,
                    Center(
                      child: SvgPicture.asset(
                        Get.isDarkMode
                            ? forgotPasswordBgDark
                            : forgotPasswordBgLight,
                        width: 260,
                        height: 257,
                      ),
                    ),
                    30.height,
                    OutlineBorderTextFormField(
                      labelText: emailAddress,
                      myFocusNode: controller.f1,
                      tempTextEditingController: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      autofocus: false,
                      checkOfErrorOnFocusChange: true,
                      inputFormatters: const [],
                      validation: (textToValidate) {
                        return controller.validateEmail(textToValidate);
                      },
                      theme: theme,
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
