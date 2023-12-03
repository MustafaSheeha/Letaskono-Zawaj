import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_assets.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_list.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextButton(
                    text: AppStrings.skip, fontSize: 0.06 * screenWidth),
              ),
              OnBoardingBody(controller: controller),
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
          ),
        ),
      ),
    );
  }
}
