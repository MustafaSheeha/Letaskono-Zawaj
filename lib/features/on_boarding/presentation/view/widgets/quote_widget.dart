
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
    required this.text,
    required this.fontSize,
  });
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Text(
      text,
      style: AppTextStyles.cairoW800PrimaryColor
          .copyWith(fontSize: fontSize * screenWidth),
      textAlign: TextAlign.center,
    );
  }
}
