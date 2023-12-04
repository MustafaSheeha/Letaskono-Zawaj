import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/on_boarding/data/on_boarding_list.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/functions/go_to_next_on_boarding.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/functions/set_is_on_boarding_visited.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/on_boarding_body.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/widgets/skip_text_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);

  int currentIndex = 0;

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
              SkipTextWidget(
                onPressed: () {
                  setIsOnBoardingvisited();
                  naviPushReplacementNamed(context, AppRoutes.register);
                },
              ),
              OnBoardingBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              currentIndex != onBoardingList.length - 1
                  ? CustomElevatedButton(
                      text: AppStrings.next,
                      onPressed: () {
                        goToNextOnBoarding(_controller);
                      },
                    )
                  : Column(
                      children: [
                        CustomElevatedButton(
                          onPressed: () {
                            setIsOnBoardingvisited();

                            naviPushReplacementNamed(
                                context, AppRoutes.register);
                          },
                          text: AppStrings.createNewAccount,
                        ),
                        CustomTextButton(
                          text: AppStrings.login,
                          fontSize: 0.04 * screenWidth,
                          onPressed: () {
                            setIsOnBoardingvisited();

                            naviPushReplacementNamed(context, AppRoutes.login);
                          },
                        )
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
