import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_assets.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.skip,
                      style: AppTextStyles.cairoW800PrimaryColor
                          .copyWith(fontSize: 0.06 * screenWidth),
                    )),
              ),
              Expanded(
                child: PageView.builder(
                  reverse: true,
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                            height: 0.3 * screenHeight,
                            width: 0.5 * screenWidth,
                            child: Image.asset(Assets.onBoardingOne)),
                        SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            textDirection: TextDirection.rtl,
                            effect: const ExpandingDotsEffect(
                                activeDotColor: AppColors.primaryColor)),
                        SizedBox(height: 0.05 * screenHeight),
                        Text(
                          AppStrings.quran1,
                          style: AppTextStyles.cairoW800PrimaryColor
                              .copyWith(fontSize: 0.05 * screenWidth),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.05 * screenHeight),
                        Text(
                          AppStrings.quran2,
                          style: AppTextStyles.cairoW800PrimaryColor
                              .copyWith(fontSize: 0.2 * screenWidth),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.05 * screenHeight),
                        Text(
                          AppStrings.quran3,
                          style: AppTextStyles.cairoW800PrimaryColor
                              .copyWith(fontSize: 0.05 * screenWidth),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.05 * screenHeight),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.next,
                            style: AppTextStyles.cairoW400White
                                .copyWith(fontSize: 0.05 * screenWidth),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
