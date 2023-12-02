import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_theme_data.dart';

class LetaskonoZawajApp extends StatelessWidget {
  const LetaskonoZawajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: goRouter,
      theme: AppThemeData().theme(),
    );
  }
}