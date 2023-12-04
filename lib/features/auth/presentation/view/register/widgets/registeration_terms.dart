import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/custom_check_box.dart';

class RegisterationTerms extends StatelessWidget {
  const RegisterationTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(TextSpan(children: [
          const TextSpan(
              text: AppStrings.iHaveAgreedWith,
              style: AppTextStyles.cairoW300PrimaryColor),
          TextSpan(
              text: AppStrings.termsAndConditions,
              style: AppTextStyles.cairoW300PrimaryColor
                  .copyWith(decoration: TextDecoration.underline)),
        ])),
        const CustomCheckBox()
      ],
    );
  }
}
