import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
     this.fontSize,
    required this.onPressed, this.style,
  });
  final String text;
  final double? fontSize;
  final void Function() onPressed;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style:style ??
              AppTextStyles.cairoW800PrimaryColor.copyWith(fontSize: fontSize),
        ));
  }
}
