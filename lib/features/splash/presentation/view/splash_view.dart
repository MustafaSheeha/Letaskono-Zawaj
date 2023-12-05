import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/database/cache/cache_helper.dart';
import 'package:letaskono_zawaj/core/service/service_locator.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_persistant_bottom_nav_bar.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/create_profile_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/register_view.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/on_boarding.dart';
import 'package:letaskono_zawaj/features/splash/presentation/view/widgets/splash_widget.dart';
import 'package:page_transition/page_transition.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isOnBoardingvisited = false;
  @override
  void initState() {
    super.initState();
    isOnBoardingvisited =
        getIt<CacheHelper>().getData(key: AppStrings.isOnBoardingvisited) ??
            false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor: AppColors.primaryColor,
          splashIconSize: 0.7 * screenWidth,
          pageTransitionType: PageTransitionType.rightToLeft,
          splashTransition: SplashTransition.scaleTransition,
          animationDuration: const Duration(seconds: 2),
          curve: Curves.bounceOut,
          splash: const SplashWidget(),
          nextScreen: !isOnBoardingvisited
              ? const OnBoardingView()
              : FirebaseAuth.instance.currentUser == null
                  ? const LoginView()
                  : FirebaseAuth.instance.currentUser!.emailVerified
                      ? CreateProfileView()
                      : const LoginView()),
    );
  }
}
