import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_assets.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_list.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/custom_smooth_page_indicator.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/on_boarding_image_widget.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/quote_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 0.83 * screenHeight,
      child: PageView.builder(
        reverse: true,
        controller: controller,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const OnBoardingImageWidget(
                imagePath: Assets.onBoardingOne,
              ),
              CustomSmoothPageIndicator(controller: controller),
              SizedBox(height: 0.05 * screenHeight),
              const QuoteWidget(
                text: AppStrings.quran1,
                fontSize: 0.05,
              ),
              SizedBox(height: 0.05 * screenHeight),
              const QuoteWidget(
                text: AppStrings.quran2,
                fontSize: 0.2,
              ),
              SizedBox(height: 0.05 * screenHeight),
              const QuoteWidget(
                text: AppStrings.quran3,
                fontSize: 0.05,
              ),
            ],
          );
        },
      ),
    );
  }
}
