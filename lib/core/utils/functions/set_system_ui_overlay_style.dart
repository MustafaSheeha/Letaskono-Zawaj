import 'package:flutter/services.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
    ),
  );
}
