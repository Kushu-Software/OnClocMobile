import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_cloc_mobile/utilities/app_theme.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utilities/app_colors.dart';

class OutlineBorderTextFormField extends StatefulWidget {
  final FocusNode myFocusNode;
  final TextEditingController tempTextEditingController;
  final String labelText;
  final TextInputType keyboardType;
  final bool autofocus;

  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function validation;
  final bool
      checkOfErrorOnFocusChange; //If true validation is checked when ever focus is changed
  final ThemeData theme;
  final Widget? suffixIcon;
  final Color? prefixIconColor;
  final bool? isSvg;
  final bool? isIconTrue;
  final bool? obscureText;
  final int? maxLine;
  final bool? isReadOnly;
  final VoidCallback? onTap;

  @override
  State<StatefulWidget> createState() {
    return _OutlineBorderTextFormField();
  }

  const OutlineBorderTextFormField({
    super.key,
    this.suffixIcon,
    this.isIconTrue,
    this.isSvg,
    this.maxLine,
    this.prefixIconColor,
    required this.labelText,
    required this.autofocus,
    required this.tempTextEditingController,
    required this.myFocusNode,
    required this.inputFormatters,
    required this.keyboardType,
    required this.textInputAction,
    required this.validation,
    required this.checkOfErrorOnFocusChange,
    required this.theme,
    this.obscureText, this.isReadOnly, this.onTap,
  });
}

class _OutlineBorderTextFormField extends State<OutlineBorderTextFormField> {
  bool isError = false;
  bool isFocus = false;
  String errorString = "";

  getLabelTextStyle() {
    return widget.theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w300,
      color: Get.isDarkMode ? whiteColor : appTextColorPrimary,
    );
  }

  getHintTextStyle(isFocus) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: isFocus
            ? appColorPrimary
            : widget.tempTextEditingController.text.isNotEmpty
                ? appColorPrimary
                : appGreyColor,
        fontWeight: FontWeight.w300,
        fontFamily: OnClocTheme.fontFamily);
  }

  getTextFieldStyle() {
    return widget.theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? whiteColor : appTextColorPrimary,
    );
  }

  getErrorTextFieldStyle() {
    return widget.theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w300,
      color: Colors.red,
    );
  }

  getBorderColor(isFocus) {
    return isFocus
        ? appColorPrimary
        : widget.tempTextEditingController.text.isNotEmpty
            ? appColorPrimary
            : greenColor.withOpacity(0.20);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FocusScope(
          child: Focus(
            onFocusChange: (focus) {
              setState(() {
                isFocus = focus;
                getBorderColor(focus);
                if (widget.checkOfErrorOnFocusChange &&
                    widget
                        .validation(widget.tempTextEditingController.text)
                        .toString()
                        .isNotEmpty) {
                  isError = true;

                  errorString =
                      widget.validation(widget.tempTextEditingController.text);
                } else {
                  isError = false;

                  errorString =
                      widget.validation(widget.tempTextEditingController.text);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? appDarkColorPrimary : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: isError
                        ? Colors.red
                        : getBorderColor(widget.myFocusNode.hasFocus),
                  )),
              child: TextFormField(
                onTap: widget.onTap,
                readOnly: widget.isReadOnly ?? false,
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                maxLines: widget.maxLine ?? 1,
                obscureText: widget.obscureText ?? false,
                focusNode: widget.myFocusNode,
                onFieldSubmitted: (v) {
               /*   widget.myFocusNode.unfocus();
                  FocusScope.of(context)
                      .requestFocus(controller.f2);*/
                },
                controller: widget.tempTextEditingController,
                style: getTextFieldStyle(),
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                inputFormatters: widget.inputFormatters,
                onChanged: (value) {
                  setState(() {
                    if (widget.validation(value).toString().isNotEmpty) {
                      isError = true;
                      errorString = widget.validation(value);
                    } else {
                      isError = false;
                      errorString = widget.validation(value);
                    }
                  });
                },
                decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: isError
                        ? getErrorTextFieldStyle()
                        : getHintTextStyle(isFocus),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    fillColor: Get.isDarkMode ? appDarkColorPrimary : Colors.white,
                    filled: true,
                    // enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 0),borderRadius: BorderRadius.circular(10)),
                    errorBorder: InputBorder.none,
                    border: InputBorder.none,
                    errorStyle: const TextStyle(height: 0),
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    suffixIcon: widget.suffixIcon.validate(),
                    floatingLabelBehavior: FloatingLabelBehavior.auto),
              ),
            ),
          ),
        ),
        Visibility(
            visible: isError ? true : false,
            child: Container(
                padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                child: Text(
                  errorString,
                  style: getErrorTextFieldStyle(),
                ))),
      ],
    );
  }
}
