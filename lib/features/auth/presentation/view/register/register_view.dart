import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/registeration_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

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
            AuthContainer(
              widget: Column(children: [
                Text(AppStrings.welcome,
                    style: AppTextStyles.cairoW800PrimaryColor
                        .copyWith(fontSize: 0.08 * screenWidth)),
                Text(AppStrings.createNewAccountToInteract,
                    style: AppTextStyles.cairoW400Grey
                        .copyWith(fontSize: 0.035 * screenWidth)),
                RegisterationForm(),
                CustomTextButton(
                  text: AppStrings.alreadyHaveAccount,
                  fontSize: 0.031 * screenWidth,
                  onPressed: () {},
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
