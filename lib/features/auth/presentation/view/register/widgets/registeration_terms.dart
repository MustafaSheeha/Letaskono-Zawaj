import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/custom_check_box.dart';

class RegisterationTerms extends StatelessWidget {
  const RegisterationTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: AppColors.offWhite,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(color: AppColors.primaryColor)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        Text(AppStrings.termsAndConditions,
                            style: AppTextStyles.cairoW300PrimaryColor
                                .copyWith(fontSize: 0.04 * screenWidth),textAlign: TextAlign.center),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(height: 0.01 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditionsIntroduction1,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditionsIntroduction2,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditionsIntroduction3,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions1,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions2,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions3,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions4,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions5,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions6,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions7,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions8,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions9,
                        ),
                        SizedBox(height: 0.005 * screenHeight),
                        const TermsAndConditionsWidget(
                          text: AppStrings.termsAndConditions10,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: AppStrings.termsAndConditions,
                style: AppTextStyles.cairoW300PrimaryColor
                    .copyWith(decoration: TextDecoration.underline)),
          ])),
        ),
        const Text(AppStrings.iHaveAgreedWith,
            style: AppTextStyles.cairoW300PrimaryColor),
        const CustomCheckBox()
      ],
    );
  }
}

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Text(
      text,
      style:
          AppTextStyles.cairoW700Grey.copyWith(fontSize: 0.035 * screenWidth),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.rtl,
    );
  }
}
