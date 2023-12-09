
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
          side: BorderSide(color: AppColors.primaryColor)),
    );
  }
}
