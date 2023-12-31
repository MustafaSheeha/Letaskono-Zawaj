import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/login/login_view.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/registeration_form.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(height: 0.05 * screenHeight),
              CardContainer(
                widget: Column(children: [
                  Text(AppStrings.welcome,
                      style: AppTextStyles.cairoW800PrimaryColor
                          .copyWith(fontSize: 0.08 * screenWidth)),
                  SizedBox(height: 0.015 * screenHeight),
                  Text(AppStrings.createNewAccountToInteract,
                      style: AppTextStyles.cairoW400Black
                          .copyWith(fontSize: 0.035 * screenWidth)),
                  SizedBox(height: 0.015 * screenHeight),
                  const RegisterationForm(),
                  CustomTextButton(
                    text: AppStrings.alreadyHaveAccount,
                    fontSize: 0.031 * screenWidth,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                      // naviPushReplacementNamed(context, AppRoutes.login);
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
