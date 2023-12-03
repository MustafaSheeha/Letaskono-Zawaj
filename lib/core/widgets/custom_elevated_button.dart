import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style:
            AppTextStyles.cairoW400White.copyWith(fontSize: 0.05 * screenWidth),
      ),
    );
  }
}
