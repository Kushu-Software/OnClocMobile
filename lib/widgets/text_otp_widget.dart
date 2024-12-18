import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_cloc_mobile/utilities/app_colors.dart';

class OnClocOtpTextField extends StatelessWidget {
  final FocusNode focusNode;
  final Function(String) onTextChanged;

  final ThemeData theme;

  const OnClocOtpTextField({
    super.key,
    required this.focusNode,
    required this.onTextChanged,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        border: Border.all(
          width: 1,
          color: appGreyColor.withOpacity(0.20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: TextField(
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
            border: InputBorder.none,
          ),
          onChanged: onTextChanged,
        ),
      ),
    );
  }
}
