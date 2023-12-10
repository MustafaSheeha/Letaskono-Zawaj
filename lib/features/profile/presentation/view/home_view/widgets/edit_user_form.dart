import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/routes/app_routes.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/functions/navigation.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_additional_info_form.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_family_info_form.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_general_info_form.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_marriage_info_form.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_personal_info_form.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_religious_info_form.dart';

class EditUserForm extends StatelessWidget {
  const EditUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditMyUsersSuccessInitial) {}
        if (state is EditMyUsersFailureInitial) {}
      },
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        return state is GetMyUsersLoadingInitial
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: profileCubit.editMaleProfileFormKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const EditGeneralInfoForm(),
                      const EditPersonalInfoForm(),
                      const EditReligiousInfoForm(),
                      const EditMarriageInfoForm(),
                      const EditFamilyInfoForm(),
                      const EditAddittionalInfoForm(),
                      state is EditMyUsersLoadingInitial
                          ? const Center(child: CircularProgressIndicator())
                          : CustomElevatedButton(
                              onPressed: () async {
                                if (profileCubit
                                    .editMaleProfileFormKey.currentState!
                                    .validate()) {
                                  await profileCubit.editMyUser();
                                }
                              },
                              text: AppStrings.saveEditings),
                      SizedBox(height: 0.09 * screenHeight),
                    ],
                  ),
                ),
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
