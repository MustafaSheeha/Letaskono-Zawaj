import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/forgot_password_view/widgets/forgot_password_form.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(height: 0.15 * screenHeight),
              CardContainer(
                widget: Column(children: [
                  Text(AppStrings.resetPassword,
                      style: AppTextStyles.cairoW300PrimaryColor
                          .copyWith(fontSize: 0.06 * screenWidth)),
                  SizedBox(height: 0.015 * screenHeight),
                  const ForgotPasswordForm(),
                  CustomTextButton(
                    text: AppStrings.login,
                    fontSize: 0.031 * screenWidth,
                    onPressed: () {
                      // naviPushReplacementNamed(context, AppRoutes.login);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()));
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
