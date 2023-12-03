
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        count: onBoardingList.length,
        textDirection: TextDirection.rtl,
        effect:
            const ExpandingDotsEffect(activeDotColor: AppColors.primaryColor));
  }
}
