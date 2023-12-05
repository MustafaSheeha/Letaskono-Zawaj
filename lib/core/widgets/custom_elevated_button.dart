import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text, this.backgroundColor, this.textColor,
  });
  final String text;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor??AppColors.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            AppTextStyles.cairoW700White.copyWith(fontSize: 0.05 * screenWidth,color: textColor),
      ),
    );
  }
}
