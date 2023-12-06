import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/general_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/identity_confirmation_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/marriage_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/personal_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/religious_info_form.dart';

class MaleForm extends StatelessWidget {
  const MaleForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CreateProfileSuccessState) {
          showAwesomeSnackbar(
              context: context,
              title: AppStrings.profileCreatedSuccessfully,
              message: AppStrings.youCanSendRecieveRequests,
              contentType: ContentType.success);
        }
        if (state is CreateProfileFailureState) {
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
          key: authCubit.createMaleProfileFormKey,
          child: Column(
            children: [
              const GeneralInfoForm(),
              const PersonalInfoForm(),
              const ReligiousInfoForm(),
              const MarriageInfoForm(),
              const IdentityConfirmationForm(),
              CustomElevatedButton(
                  onPressed: () {
                    if (authCubit.createMaleProfileFormKey.currentState!
                        .validate()) {
                      BlocProvider.of<AuthCubit>(context).saveUserModel();
                    }
                  },
                  text: AppStrings.saveData),
              SizedBox(height: 0.03 * screenHeight),
            ],
          ),
        );
      },
    );
  }
}
