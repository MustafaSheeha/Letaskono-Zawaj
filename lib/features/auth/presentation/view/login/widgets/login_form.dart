import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (!FirebaseAuth.instance.currentUser!.emailVerified) {
            showAwesomeSnackbar(
                context: context,
                title: AppStrings.emailUnverfied,
                message: AppStrings
                    .pleaseActivateYourAccountThroughLinkSentToEmailToLogin,
                contentType: ContentType.warning);
          } else {
            showAwesomeSnackbar(
                context: context,
                title: AppStrings.accountLoggedSuccessfully,
                message: AppStrings.redirectingToCreateProfile,
                contentType: ContentType.success);
            customFutureDelayed(context);
          }
        } else if (state is LoginFailureState) {
          showAwesomeSnackbar(
              context: context,
              title: AppStrings.someThingWentWrong,
              message: state.errorMessege,
              contentType: ContentType.failure);
        } else if (state is ConnectionFailureState) {
          showAwesomeSnackbar(
              context: context,
              title: AppStrings.someThingWentWrong,
              message: state.errorMessege,
              contentType: ContentType.failure);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.loginFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                  hintText: AppStrings.email,
                  keyboardType: TextInputType.text,
                  onChanged: (email) {
                    authCubit.userModel.email = email;
                  },
                  prefixIcon: const Icon(Icons.alternate_email),
                  obscureText: false),
              SizedBox(height: 0.015 * screenHeight),
              CustomTextFormField(
                  hintText: AppStrings.password,
                  keyboardType: TextInputType.text,
                  onChanged: (password) {
                    authCubit.userModel.password = password;
                  },
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true),
              SizedBox(height: 0.015 * screenHeight),
              state is ConnectionLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : state is LoginLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          onPressed: () async {
                            if (authCubit.loginFormKey.currentState!
                                .validate()) {
                              await authCubit.signInWithEmailAndPassword();
                              
                            }
                          },
                          text: AppStrings.login),
            ],
          ),
        );
      },
    );
  }

  Future<void> customFutureDelayed(BuildContext context) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => naviPushReplacementNamed(context, AppRoutes.createProfile),
    );
  }
}
