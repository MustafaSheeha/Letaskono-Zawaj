import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

AppBar flutterAppBar() {
    return AppBar(
      scrolledUnderElevation: 22,
      centerTitle: true,
      title: Text(
        AppStrings.quran2,
        style: AppTextStyles.cairoW700White.copyWith(fontSize: 55),
      ),
      leading: const Icon(
        Icons.notifications,
        color: AppColors.red,
        size: 30,
      ),
      toolbarHeight: 160,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(80),
              bottomRight: Radius.circular(80))),
    );
  }
