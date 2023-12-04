import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    required this.obscureText,
    this.onChanged,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
   bool hidePassword=true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: widget.obscureText
          ? TextFormField(
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                border: border(),
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: enabledBorder(),
                errorBorder: errorBorder(),
                focusedBorder: focusedBorder(),
                focusedErrorBorder: focusedErrorBorder(),
                hintText: widget.hintText,
                hintStyle:  style(),
                prefixIcon: widget.prefixIcon,
                prefixIconColor: AppColors.primaryColor,
                suffixIcon: IconButton(
                  icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      hidePassword=!hidePassword;
                    });
                  },
                ),
                suffixIconColor: AppColors.primaryColor,
              ),
              keyboardType: widget.keyboardType,
              obscureText: hidePassword,
              onChanged: widget.onChanged,
              onTapOutside: unfocusOnTapOutside,
              style: style(),
              validator: validator,
            )
          : TextFormField(
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                border: border(),
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: enabledBorder(),
                errorBorder: errorBorder(),
                focusedBorder: focusedBorder(),
                focusedErrorBorder: focusedErrorBorder(),
                hintText: widget.hintText,
                hintStyle:  style(),
                prefixIcon: widget.prefixIcon,
                prefixIconColor: AppColors.primaryColor,
              ),
              keyboardType: widget.keyboardType,
              obscureText: false,
              onChanged: widget.onChanged,
              onTapOutside: unfocusOnTapOutside,
              style: style(),
              validator: validator,
            ),
    );
  }

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

  TextStyle style() {
    return AppTextStyles.cairoW800PrimaryColor
        .copyWith(fontWeight: FontWeight.w300);
  }

  String? validator(value) {
    if (value!.isEmpty) {
      return 'مطلوب';
    } else {
      return null;
    }
  }

  void unfocusOnTapOutside(event) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
