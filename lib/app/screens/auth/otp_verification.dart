import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/app/controllers/auth/otp_verification.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_constants.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_routes.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:on_cloc_mobile/utilities/app_widgets.dart';
import 'package:on_cloc_mobile/widgets/button_common_widget.dart';
import 'package:on_cloc_mobile/widgets/text_otp_widget.dart';

class OnClocOtpVerificationScreen extends StatefulWidget {
  const OnClocOtpVerificationScreen({super.key});

  @override
  OnClocOtpVerificationScreenState createState() =>
      OnClocOtpVerificationScreenState();
}

class OnClocOtpVerificationScreenState
    extends State<OnClocOtpVerificationScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode
        ? OnClocTheme.onClocDarkTheme
        : OnClocTheme.onClocLightTheme;
    startTimer();
  }

  late Timer _timer;
  int _seconds = 30;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_seconds == 0) {
          _timer.cancel();
        } else {
          _seconds--;
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      _seconds = 30;
    });
    startTimer();
  }

  final OnClocOtpVerificationController controller =
      Get.put(OnClocOtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: onClocCommonAppBarWidget(context),
      backgroundColor: theme.scaffoldBackgroundColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 20,
            top: 15,
            right: 20,
            bottom: GetPlatform.isIOS
                ? MediaQuery.of(context).padding.bottom
                : 20.0),
        child: OnClocCommonButton(
          bgColor: (controller.validateOtp())
              ? appColorPrimary
              : appGreyColor.withOpacity(0.20),
          textColor: (controller.validateOtp())
              ? Colors.white
              : Get.isDarkMode
                  ? Colors.white
                  : appTextColorPrimary,
          onPressed: () {
            if (controller.validateOtp()) {
              Get.toNamed(OnClocRoutes.onClocResetPasswordScreen);
            } else {
              Get.snackbar('Error', 'Please enter all digits');
            }
          },
          text: continueText,
        ),
      ),
      body: GetBuilder<OnClocOtpVerificationController>(
          init: controller,
          tag: 'on_cloc_otp',
          builder: (controller) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      enterVerificationCode,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    8.height,
                    Text(
                      verificationToMobile,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w300, color: appGreyColor),
                    ),
                    30.height,
                    Center(
                      child: SvgPicture.asset(
                        Get.isDarkMode ? otpVerifyBgDark : otpVerifyBgLight,
                        width: 260,
                        height: 257,
                      ),
                    ),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: OnClocOtpTextField(
                            focusNode: controller.focusNodes[index],
                            onTextChanged: (value) {
                              controller.otpValues[index] = value;
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            theme: theme,
                          ),
                        ),
                      ),
                    ),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        if (_seconds == 0) {
                          resetTimer();
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          textAlign: TextAlign.start,
                          TextSpan(
                            text: (_seconds == 0)
                                ? ''
                                : '${(_seconds ~/ 60).toString().padLeft(2, '0')}:${(_seconds % 60).toString().padLeft(2, '0')}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                text: ' Resend it',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: appColorPrimary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
