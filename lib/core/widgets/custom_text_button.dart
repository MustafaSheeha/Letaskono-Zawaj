import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.fontSize,
  });
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style:
              AppTextStyles.cairoW800PrimaryColor.copyWith(fontSize: fontSize),
        ));
  }
}