
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_phone_field.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/registeration_terms.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/who_are_you_widget.dart';

class RegisterationForm extends StatelessWidget {
  const RegisterationForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      child: Column(
        children: [
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
          CustomElevatedButton(onPressed: () {}, text: AppStrings.register),
        ],
      ),
    );
  }
}
