import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/awesome_snackbar_content.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/female_parent_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/general_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/marriage_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/personal_info_form.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/religious_info_form.dart';

class FemaleForm extends StatelessWidget {
  const FemaleForm({super.key});
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is CreateProfileSuccessState) {
              showAwesomeSnackbar(
                  context: context,
                  title: AppStrings.profileCreatedSuccessfully,
                  message: AppStrings.youCanSendRecieveRequests,
                  contentType: ContentType.success);
              customFutureDelayed(context);
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
              key: authCubit.createFemaleProfileFormKey,
              child: Column(
                children: [
                  const GeneralInfoForm(),
                  const PersonalInfoForm(),
                  const ReligiousInfoForm(),
                  const MarriageInfoForm(),
                  const FemaleParentInfoForm(),
                  state is CreateProfileLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          onPressed: () {
                            if (authCubit
                                .createFemaleProfileFormKey.currentState!
                                .validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .saveUserModel();
                            }
                          },
                          text: AppStrings.saveData),
                  SizedBox(height: 0.03 * screenHeight),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> customFutureDelayed(BuildContext context) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => naviPushReplacementNamed(
          context, AppRoutes.customPersistantBottomNavBar),
    );
  }
}
