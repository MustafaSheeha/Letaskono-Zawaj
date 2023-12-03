import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';

class SkipTextWidget extends StatelessWidget {
  const SkipTextWidget({
    super.key, required this.onPressed,
  });
final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomTextButton(
          onPressed: onPressed,
          text: AppStrings.skip,
          fontSize: 0.06 * screenWidth),
    );
  }
}
