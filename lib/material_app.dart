import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/features/splash/splash_view.dart';

class LetaskonoZawajApp extends StatelessWidget {
  const LetaskonoZawajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}