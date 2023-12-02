
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_assets.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CircleAvatar(
          radius: 0.275 * screenWidth,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 0.265 * screenWidth,
            backgroundColor: AppColors.primaryColor,
            child: CircleAvatar(
              radius: 0.25 * screenWidth,
              backgroundColor: Colors.white,
              child: Image.asset(
                Assets.splashLogo,
              ),
            ),
          ),
        ),
        Text(
          AppStrings.homeSlagon1,
          style: TextStyle(
            fontSize: 0.05 * screenWidth,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        )
      ],
    );
  }
}
