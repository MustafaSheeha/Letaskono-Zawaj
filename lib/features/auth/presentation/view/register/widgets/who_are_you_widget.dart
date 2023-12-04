
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';

class WhoAreYouWidget extends StatelessWidget {
  const WhoAreYouWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomElevatedButton(
            onPressed: () {}, text: AppStrings.iamFemale),
        CustomElevatedButton(
            onPressed: () {}, text: AppStrings.iamMale),
        Text(AppStrings.whoAreYou,
            style: AppTextStyles.cairoW300PrimaryColor
                .copyWith(fontSize: 0.035 * screenWidth)),
      ],
    );
  }
}
