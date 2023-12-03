import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/skip_text_widget.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SkipTextWidget(screenWidth: screenWidth),
              OnBoardingBody(controller: controller),
              CustomElevatedButton(
                text: AppStrings.next,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
