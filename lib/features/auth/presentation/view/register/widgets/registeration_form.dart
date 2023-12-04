import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_phone_field.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/registeration_terms.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/register/widgets/who_are_you_widget.dart';

class RegisterationForm extends StatelessWidget {
  const RegisterationForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showAwesomeSnackbar(
              context: context,
              title: AppStrings.accountSuccessfullyCreated,
              message:
                  AppStrings.pleaseActivateYourAccountThroughLinkSentToEmail,
              contentType: ContentType.success);
              naviPushReplacementNamed(context, AppRoutes.login);
        } else if (state is RegisterFailureState) {
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
          key: authCubit.registerFormKey,
          child: Column(
            children: [
              const WhoAreYouWidget(),
              SizedBox(height: 0.015 * screenHeight),
              CustomTextFormField(
                  hintText: AppStrings.nameInArabic,
                  keyboardType: TextInputType.text,
                  onChanged: (nameInArabic) {
                    authCubit.registerationUserModel.name = nameInArabic;
                  },
                  prefixIcon: const Icon(Icons.person),
                  obscureText: false),
              SizedBox(height: 0.015 * screenHeight),
              CustomTextFormField(
                  hintText: AppStrings.email,
                  keyboardType: TextInputType.text,
                  onChanged: (email) {
                    authCubit.registerationUserModel.email = email;
                  },
                  prefixIcon: const Icon(Icons.alternate_email),
                  obscureText: false),
              SizedBox(height: 0.015 * screenHeight),
              CustomPhoneField(
                onChanged: (phone) {
                  authCubit.registerationUserModel.phone = phone.completeNumber;
                },
              ),
              SizedBox(height: 0.015 * screenHeight),
              CustomTextFormField(
                  hintText: AppStrings.password,
                  keyboardType: TextInputType.text,
                  onChanged: (password) {
                    authCubit.registerationUserModel.password = password;
                  },
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true),
              const RegisterationTerms(),
              state is RegisterLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : CustomElevatedButton(
                      backgroundColor: !authCubit.termsAndConditionCheckBox
                          ? AppColors.offWhite
                          : AppColors.primaryColor,
                      onPressed: () {
                        if (authCubit.termsAndConditionCheckBox == true) {
                          if (authCubit.registerFormKey.currentState!
                              .validate()) {
                            authCubit.createUserWithEmailAndPassword();
                          }
                        }
                      },
                      text: AppStrings.register),
            ],
          ),
        );
      },
    );
  }
}
