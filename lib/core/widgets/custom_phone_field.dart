import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/outline_input_border.dart';
import 'package:letaskono_zawaj/core/utils/functions/validator.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
    this.onChanged,
  });
  final Function(PhoneNumber)? onChanged;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return IntlPhoneField(
      // autovalidateMode: AutovalidateMode.always,

      cursorColor: AppColors.primaryColor,
      dropdownTextStyle: AppTextStyles.cairoW800PrimaryColor,
      dropdownIcon: dropdownIcon(),
      validator: validator,
      onChanged: onChanged,
      textAlign: TextAlign.end,
      textInputAction: TextInputAction.next,
      pickerDialogStyle: pickerDialogStyle(),
      invalidNumberMessage: AppStrings.invalidNumberMessage,
      initialCountryCode: AppStrings.initialCountryCode,
      languageCode: AppStrings.languageCode,
      decoration: InputDecoration(
        border: border(),
        enabledBorder: enabledBorder(),
        focusedBorder: focusedBorder(),
        errorBorder: errorBorder(),
        focusedErrorBorder: focusedErrorBorder(),
        hintText: AppStrings.phoneNumber,
        contentPadding: const EdgeInsets.all(8),
        hintStyle: AppTextStyles.cairoW300PrimaryColor,
        suffixIcon: suffixIcon(),
      ),
    );
  }

  Icon dropdownIcon() {
    return const Icon(
      Icons.arrow_drop_down,
      color: AppColors.primaryColor,
    );
  }

  PickerDialogStyle pickerDialogStyle() {
    return PickerDialogStyle(
        listTileDivider: const Divider(
          color: AppColors.primaryColor,
          endIndent: 50,
          indent: 50,
        ),
        countryNameStyle: AppTextStyles.cairoW800PrimaryColor,
        countryCodeStyle: AppTextStyles.cairoW800PrimaryColor,
        searchFieldCursorColor: AppColors.primaryColor,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        searchFieldInputDecoration: searchFieldInputDecoration());
  }

  InputDecoration searchFieldInputDecoration() {
    return const InputDecoration(
      hintText: AppStrings.hintTextPhoneField,
      hintStyle: AppTextStyles.cairoW800PrimaryColor,
      hintTextDirection: TextDirection.rtl,
      prefixIcon: Icon(Icons.search),
    );
  }

  Icon suffixIcon() {
    return const Icon(
      Icons.phone,
      color: AppColors.primaryColor,
    );
  }
}
