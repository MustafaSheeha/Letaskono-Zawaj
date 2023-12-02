import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

class AppThemeData {
  ThemeData? theme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: appBarTheme(),
      dialogBackgroundColor: Colors.white,
      elevatedButtonTheme: elevatedButtonTheme(),
      progressIndicatorTheme: progressIndicatorTheme(),
      textButtonTheme: textButtonTheme(),
      textTheme: const TextTheme(),
      dialogTheme: dialogTheme(),
    );
  }

  AppBarTheme? appBarTheme() {
    return const AppBarTheme(
      color: AppColors.primaryColor,
      elevation: 0,
      
    );
  }

  ElevatedButtonThemeData? elevatedButtonTheme() {
    return const ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              AppColors.primaryColor,
            ),
            elevation: MaterialStatePropertyAll(22)));
  }

  ProgressIndicatorThemeData? progressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: Colors.white,
      circularTrackColor: AppColors.primaryColor,
    );
  }

  TextButtonThemeData? textButtonTheme() {
    return const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          Color(0xff61646a),
        ),
      ),
    );
  }

  DialogTheme? dialogTheme() {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
