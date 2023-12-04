import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';

class WhoAreYouWidget extends StatefulWidget {
  const WhoAreYouWidget({
    super.key,
  });

  @override
  State<WhoAreYouWidget> createState() => _WhoAreYouWidgetState();
}

class _WhoAreYouWidgetState extends State<WhoAreYouWidget> {
  Color manButtonColor = AppColors.offWhite;
  Color manTextColor = AppColors.primaryColor;
  Color womanButtonColor = AppColors.offWhite;
  Color womanTextColor = AppColors.primaryColor;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomElevatedButton(
            onPressed: () {
              setState(() {
                womanButtonColor = AppColors.primaryColor;
                womanTextColor = AppColors.white;

                manButtonColor = AppColors.offWhite;
                manTextColor = AppColors.primaryColor;
              });
            },
            text: AppStrings.iamFemale,
            textColor: womanTextColor,
            backgroundColor: womanButtonColor),
        CustomElevatedButton(
            onPressed: () {
              setState(() {
                manButtonColor = AppColors.primaryColor;
                manTextColor = AppColors.white;

                womanButtonColor = AppColors.offWhite;
                womanTextColor = AppColors.primaryColor;
              });
            },
            text: AppStrings.iamMale,
            textColor: manTextColor,
            backgroundColor: manButtonColor),
        Text(AppStrings.whoAreYou,
            style: AppTextStyles.cairoW300PrimaryColor
                .copyWith(fontSize: 0.035 * screenWidth)),
      ],
    );
  }
}
