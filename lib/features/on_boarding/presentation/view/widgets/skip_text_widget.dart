
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';

class SkipTextWidget extends StatelessWidget {
  const SkipTextWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomTextButton(
          text: AppStrings.skip, fontSize: 0.06 * screenWidth),
    );
  }
}
