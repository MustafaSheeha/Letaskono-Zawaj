import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: screenWidth,
        height: 0.15 * screenHeight,
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
                bottomLeft: Radius.circular(80))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 0.03 * screenWidth),
                const Icon(Icons.notifications_active,
                    color: AppColors.red, size: 30),
                SizedBox(width: 0.73 * screenWidth),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu_outlined,
                        color: AppColors.white, size: 30)),
                SizedBox(width: 0.03 * screenWidth),
              ],
            ),
            // SizedBox(height: 0.05*screenHeight),
            Text(
              AppStrings.quran2,
              style: AppTextStyles.cairoW400White.copyWith(
                fontSize: 0.1 * screenWidth,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
