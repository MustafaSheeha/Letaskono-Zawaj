import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class EditGeneralInfoForm extends StatefulWidget {
  const EditGeneralInfoForm({super.key});

  @override
  State<EditGeneralInfoForm> createState() => _EditGeneralInfoFormState();
}

class _EditGeneralInfoFormState extends State<EditGeneralInfoForm> {
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
                    const CustomHeaderTitle(
                        headerTitle: AppStrings.generalInfo),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.martialStatus,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.userModel.maritalStatus = p0;
                        });
                      },
                      selectedValue: profileCubit.userModel.maritalStatus,
                      dropdownButtonList:
                          profileCubit.userModel.gender == "Male"
                              ? DropdownButtonList.martialStatusMaleList
                              : DropdownButtonList.martialStatusFemaleList,
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.nationality,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.userModel.nationality = p0;
                        });
                      },
                      selectedValue: profileCubit.userModel.nationality,
                      dropdownButtonList:
                          profileCubit.userModel.gender == "Male"
                              ? DropdownButtonList.nationalityMaleList
                              : DropdownButtonList.nationalityFemaleList,
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.currentResidenceCountry,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue:
                          profileCubit.userModel.currentResidenceCountry,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.currentResidenceCountry = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.currentResidenceCity,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.currentResidenceCity,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.currentResidenceCity = p0;
                      },
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.educationalDegree,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.userModel.educationalDegree = p0;
                        });
                      },
                      selectedValue: profileCubit.userModel.educationalDegree,
                      dropdownButtonList:
                          profileCubit.userModel.gender == "Male"
                              ? DropdownButtonList.educationalDegreeList
                              : DropdownButtonList.educationalDegreeList,
                    ),
                    SizedBox(height: 0.01 * screenHeight),
                    const Text(AppStrings.job,
                        style: AppTextStyles.cairoW300PrimaryColor),
                    SizedBox(height: 0.01 * screenHeight),
                    CustomTextFormField(
                      initialValue: profileCubit.userModel.job,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.job = p0;
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
