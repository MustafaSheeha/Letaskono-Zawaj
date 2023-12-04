import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_theme_data.dart';
import 'package:letaskono_zawaj/core/widgets/custom_persistant_bottom_nav_bar.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/register_view.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/on_boarding.dart';
import 'package:letaskono_zawaj/features/splash/presentation/view/splash_view.dart';

class LetaskonoZawajApp extends StatelessWidget {
  const LetaskonoZawajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashView(),
      routes: {
        AppRoutes.splash: (context) => const SplashView(),
        AppRoutes.onBoarding: (context) => const OnBoardingView(),
        AppRoutes.customPersistantBottomNavBar: (context) =>
            CustomPersistantBottomNavBar(),
        AppRoutes.register: (context) => const RegisterView(),
        AppRoutes.login: (context) => const LoginView(),
      },
      theme: AppThemeData().theme(),
    );
  }
}
