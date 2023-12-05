import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';

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
      activeColor: AppColors.primaryColor,
      side: const BorderSide(color: AppColors.primaryColor),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
    );
  }

  void onChanged(newValue) {
    setState(() {
      value = newValue;
      BlocProvider.of<AuthCubit>(context)
          .updateTermsAndConditionCheckBox(newValue);
    });
  }
}
