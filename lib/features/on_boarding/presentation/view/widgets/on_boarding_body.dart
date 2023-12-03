import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_list.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/custom_smooth_page_indicator.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/on_boarding_image_widget.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/quote_widget.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.controller, required this.onPageChanged});
  final PageController controller;
  final void Function(int) onPageChanged;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 0.79 * screenHeight,
      child: PageView.builder(
        reverse: true,
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              OnBoardingImageWidget(
                imagePath: onBoardingList[index].imagePath,
              ),
              CustomSmoothPageIndicator(controller: controller),
              SizedBox(height: 0.05 * screenHeight),
              QuoteWidget(
                text: onBoardingList[index].quoteOne,
                fontSize: onBoardingList[index].isThird ? 0.04 : 0.055,
              ),
              SizedBox(height: 0.05 * screenHeight),
              QuoteWidget(
                text: onBoardingList[index].quoteTwo,
                fontSize: onBoardingList[index].isThird ? 0.04 : 0.2,
              ),
              SizedBox(height: 0.05 * screenHeight),
              QuoteWidget(
                text: onBoardingList[index].quoteThree,
                fontSize: onBoardingList[index].isThird ? 0.04 : 0.055,
              ),
            ],
          );
        },
      ),
    );
  }
}
