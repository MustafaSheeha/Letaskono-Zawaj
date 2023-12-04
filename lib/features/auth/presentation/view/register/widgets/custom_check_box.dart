
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      checkColor: AppColors.primaryColor,
      activeColor: AppColors.primaryColor,
      side: side(),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
    );
  }

  BorderSide side() => const BorderSide(color: AppColors.primaryColor);

  void onChanged(newValue) {
    setState(() {
      value = newValue;
    });
  }
}
