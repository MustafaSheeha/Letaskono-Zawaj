import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class EditFamilyInfoForm extends StatefulWidget {
  const EditFamilyInfoForm({super.key});

  @override
  State<EditFamilyInfoForm> createState() => _EditFamilyInfoFormState();
}

class _EditFamilyInfoFormState extends State<EditFamilyInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetMyUsersSuccessInitial) {}
        if (state is GetAllUsersFailureInitial) {}
      },
      builder: (context, state) {
        return state is GetMyUsersLoadingInitial
            ? const Center(child: CircularProgressIndicator())
            : CardContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 0.02 * screenHeight),
                    const CustomHeaderTitle(headerTitle: AppStrings.familyInfo),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.fatherJob,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.fatherJob,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.fatherJob = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.motherJob,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.motherJob,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.motherJob = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.boysNumber,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.boysNumber,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.boysNumber = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.girlsNumber,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.girlsNumber,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.girlsNumber = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.howOldYourChildren,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.howOldYourChildren,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.howOldYourChildren = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.yourRelationWithFamily,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue:
                          profileCubit.userModel.yourRelationWithFamily,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.yourRelationWithFamily = p0;
                      },
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                  ],
                ),
              );
      },
    );
  }
}
