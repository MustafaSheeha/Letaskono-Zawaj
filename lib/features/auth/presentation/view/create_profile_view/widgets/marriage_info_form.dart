import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class MarriageInfoForm extends StatelessWidget {
  const MarriageInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AuthContainer(
      widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const CustomHeaderTitle(headerTitle: AppStrings.marriageInfo),
        const Text(
          AppStrings.tellAboutYou,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {},
        ),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.tellAboutPartner,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),SizedBox(height: 0.01 * screenHeight),
        CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {},
        ),
        SizedBox(height: 0.01 * screenHeight),
      ]),
    );
  }
}
