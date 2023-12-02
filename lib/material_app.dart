import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_theme_data.dart';
import 'package:letaskono_zawaj/features/splash/splash_view.dart';

class LetaskonoZawajApp extends StatelessWidget {
  const LetaskonoZawajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: AppThemeData().theme(),
      home: SplashView(),
    );
  }
}