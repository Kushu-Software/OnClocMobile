import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';
import 'package:on_cloc_mobile/utilities/app_images.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';

Widget onClocCommonCacheImageWidget(String? url, double height,
    {double? width, BoxFit? fit, Color? color}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        color: color,
        fit: fit ?? BoxFit.cover,
        errorWidget: (_, __, ___) {
          return SizedBox(height: height, width: width);
        },
      );
    } else {
      return Image.network(url!,
          height: height, width: width, fit: fit ?? BoxFit.cover);
    }
  } else {
    return Image.asset(url!,
        height: height, width: width, fit: fit ?? BoxFit.cover);
  }
}

Widget? Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset(placeholderImage, fit: BoxFit.cover);

PreferredSizeWidget onClocCommonAppBarWidget(
  BuildContext context, {
  String? titleText,
  Widget? actionWidget,
  Widget? actionWidget2,
  Widget? actionWidget3,
  Widget? leadingWidget,
  Color? backgroundColor,
  double? leadingWidth,
  bool? isTitleCenter,
  bool isback = true,
}) {
  Color bgColor = Get.isDarkMode ? appDarkColorPrimary : Colors.white;
  return AppBar(
    centerTitle: isTitleCenter ?? true,
    backgroundColor: backgroundColor ?? bgColor,
    leadingWidth: leadingWidth,
    leading: isback
        ? IconButton(
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset(
              backIcon,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : appTextColorPrimary,
                  BlendMode.srcIn),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : leadingWidget,
    actions: [
      actionWidget ?? const SizedBox(),
      actionWidget2 ?? const SizedBox(),
      actionWidget3 ?? const SizedBox()
    ],
    title: Text(
      titleText ?? "",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontFamily: OnClocTheme.fontFamily,
          fontSize: 16),
    ),
    elevation: 0.0,
  );
}

InputDecoration onClocInputDecoration(
  BuildContext context, {
  String? prefixIcon,
  String? suffixIcon,
  String? labelText,
  double? borderRadius,
  String? hintText,
  bool? isSvg,
  Color? fillColor,
  Color? borderColor,
  Color? focusBorderColor,
  Color? hintColor,
  Color? prefixIconColor,
  double? leftContentPadding,
  double? rightContentPadding,
  double? topContentPadding,
  double? bottomContentPadding,
  double? borderWidth,
  double? suffixRightPadding,
  VoidCallback? onSuffixPressed,
}) {
  return InputDecoration(
    // prefixIconColor: prefixIconColor,
    counterText: "",
    contentPadding: EdgeInsets.fromLTRB(
        leftContentPadding ?? 20,
        topContentPadding ?? 20,
        rightContentPadding ?? 20,
        bottomContentPadding ?? 20),
    labelText: labelText,
    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: hintColor ?? appTextColorPrimary.withOpacity(0.20),
        fontWeight: FontWeight.w400,
        fontFamily: OnClocTheme.fontFamily),
    alignLabelWithHint: true,
    hintText: hintText.validate(),
    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: hintColor ?? appTextColorPrimary.withOpacity(0.20),
        fontWeight: FontWeight.w400,
        fontFamily: OnClocTheme.fontFamily),
    isDense: true,
    prefixIcon: prefixIcon != null
        ? Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: isSvg == null
                ? SvgPicture.asset(
                    prefixIcon,
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(
                        prefixIconColor ?? appTextColorPrimary,
                        BlendMode.srcIn),
                  )
                : Image.asset(
                    prefixIcon,
                    width: 24,
                    height: 24,
                  ),
          )
        : null,
    prefixIconConstraints: const BoxConstraints(
      minWidth: 20,
      minHeight: 20,
    ),
    suffixIconConstraints: const BoxConstraints(
      minWidth: 20,
      minHeight: 20,
    ),
    suffixIcon: suffixIcon != null
        ? InkWell(
            onTap: onSuffixPressed ?? () {},
            child: Padding(
              padding:
                  EdgeInsets.only(left: 20, right: suffixRightPadding ?? 10),
              child: isSvg == null
                  ? SvgPicture.asset(
                      suffixIcon,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                          prefixIconColor ?? appTextColorPrimary,
                          BlendMode.srcIn),
                    )
                  : Image.asset(
                      suffixIcon,
                      width: 24,
                      height: 24,
                    ),
            ),
          )
        : null,
    border: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(
          color: borderColor ?? appGreyColor.withOpacity(0.20),
          width: borderWidth ?? 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(
          color: borderColor ?? appGreyColor.withOpacity(0.20),
          width: borderWidth ?? 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(
          color: focusBorderColor ?? appColorPrimary,
          width: borderWidth ?? 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: borderWidth ?? 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: BorderSide(color: Colors.red, width: borderWidth ?? 1.0),
    ),
    errorMaxLines: 2,
    errorStyle: primaryTextStyle(
        color: Colors.red, size: 12, fontFamily: OnClocTheme.fontFamily),
    filled: true,
    fillColor: fillColor ?? Colors.white,
  );
}

extension Ext on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get w => MediaQuery.of(this).size.width;

  double get h => MediaQuery.of(this).size.height;
}
