import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomHeaderTitle extends StatelessWidget {
  const CustomHeaderTitle({
    super.key,
    required this.headerTitle,
  });
  final String headerTitle;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final textFontSize = MediaQuery.of(context).textScaleFactor;
    return Column(
      children: [
        
        Center(
            child: Text(
          headerTitle,
          style:  AppTextStyles.cairoW800PrimaryColor.copyWith(fontSize: 0.04*screenWidth),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )),
        const Divider(
          color: AppColors.primaryColor,
          thickness: 1,
          indent: 33,
          endIndent: 33,
        ),
      ],
    );
  }
}
