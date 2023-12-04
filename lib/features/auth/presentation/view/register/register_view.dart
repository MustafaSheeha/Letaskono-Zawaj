import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_phone_field.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/registeration_terms.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/who_are_you_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const CustomAppBar(),
            SizedBox(height: 0.05 * screenHeight),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 0.035 * screenWidth,
                vertical: 0.01 * screenHeight,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 0.08 * screenWidth,
                  vertical: 0.01 * screenHeight),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(80)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      offset: Offset(3.0, 3.0))
                ],
              ),
              child: Column(children: [
                Text(AppStrings.welcome,
                    style: AppTextStyles.cairoW800PrimaryColor
                        .copyWith(fontSize: 0.08 * screenWidth)),
                Text(AppStrings.createNewAccountToInteract,
                    style: AppTextStyles.cairoW400Grey
                        .copyWith(fontSize: 0.035 * screenWidth)),
                SizedBox(height: 0.02 * screenHeight),
                const WhoAreYouWidget(),
                SizedBox(height: 0.015 * screenHeight),
                CustomTextFormField(
                    hintText: AppStrings.nameInArabic,
                    keyboardType: TextInputType.text,
                    onChanged: (p0) {},
                    prefixIcon: const Icon(Icons.person),
                    obscureText: false),
                SizedBox(height: 0.015 * screenHeight),
                CustomTextFormField(
                    hintText: AppStrings.email,
                    keyboardType: TextInputType.text,
                    onChanged: (p0) {},
                    prefixIcon: const Icon(Icons.alternate_email),
                    obscureText: false),
                SizedBox(height: 0.015 * screenHeight),
                CustomPhoneField(
                  onChanged: (p0) {},
                ),
                SizedBox(height: 0.015 * screenHeight),
                CustomTextFormField(
                    hintText: AppStrings.password,
                    keyboardType: TextInputType.text,
                    onChanged: (p0) {},
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: true),
                const RegisterationTerms(),
                CustomElevatedButton(
                    onPressed: () {}, text: AppStrings.register),
                CustomTextButton(
                  text: AppStrings.alreadyHaveAccount,
                  fontSize: 0.031 * screenWidth,
                  onPressed: () {},
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
