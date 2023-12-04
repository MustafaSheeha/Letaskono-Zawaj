import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';

OutlineInputBorder focusedErrorBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: AppColors.red));
}

OutlineInputBorder focusedBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: AppColors.primaryColor));
}

OutlineInputBorder errorBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: AppColors.red));
}

OutlineInputBorder enabledBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: AppColors.primaryColor));
}

OutlineInputBorder border() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: AppColors.primaryColor));
}
