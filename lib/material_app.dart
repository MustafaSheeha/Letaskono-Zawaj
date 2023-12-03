import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_theme_data.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/register_view.dart';
import 'package:letaskono_zawaj/features/on_boarding/presentation/view/on_boarding.dart';
import 'package:letaskono_zawaj/features/splash/presentation/view/splash_view.dart';

class LetaskonoZawajApp extends StatelessWidget {
  const LetaskonoZawajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        AppRoutes.splash:(context) => SplashView(),
        AppRoutes.onBoarding:(context) => OnBoardingView(), 
        AppRoutes.login:(context) => LoginView(), 
        AppRoutes.register:(context) => RegisterView(), 
      },
      home: SplashView(),
      theme: AppThemeData().theme(),
    );
  }
}