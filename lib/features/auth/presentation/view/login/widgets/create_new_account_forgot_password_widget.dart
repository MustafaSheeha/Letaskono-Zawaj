import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/forgot_password_view/forgot_password_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/register_view.dart';

class CreateNewAccountForgotPasswordWidget extends StatelessWidget {
  const CreateNewAccountForgotPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            // naviPushReplacementNamed(context, AppRoutes.register);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterView(),));
          },
          child: const Text(AppStrings.createNewAccount,
              style: AppTextStyles.cairoW300PrimaryColor),
        ),
        TextButton(
          onPressed: () {
            // naviPushReplacementNamed(context, AppRoutes.forgotPassword);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ForgotPasswordView(),));

          },
          child: const Text(AppStrings.forgotPassword,
              style: AppTextStyles.cairoW300PrimaryColor),
        ),
      ],
    );
  }
}
