
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.primaryColor,
      endIndent: 50,
      indent: 50,
    );
  }
}