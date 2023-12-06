import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_state.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class GeneralInfoForm extends StatefulWidget {
  const GeneralInfoForm({super.key});

  @override
  State<GeneralInfoForm> createState() => _GeneralInfoFormState();
}

class _GeneralInfoFormState extends State<GeneralInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return AuthContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 0.02 * screenHeight),
          const CustomHeaderTitle(headerTitle: AppStrings.generalInfo),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.martialStatus,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.maritalStatus = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.maritalStatus,
                  dropdownButtonList: DropdownButtonList.martialStatusList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.maritalStatus = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.maritalStatus,
                  dropdownButtonList: DropdownButtonList.martialStatusList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.nationality,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.nationality = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.nationality,
                  dropdownButtonList: DropdownButtonList.nationalityList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.nationality = p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.nationality,
                  dropdownButtonList: DropdownButtonList.nationalityList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.currentResidenceCountry,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit.createMaleProfileModel
                        .currentResidenceCountry = p0;
                  },
                )
              : CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit.createFemaleProfileModel
                        .currentResidenceCountry = p0;
                  },
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.currentResidenceCity,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit.createMaleProfileModel.currentResidenceCity =
                        p0;
                  },
                )
              : CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit
                        .createFemaleProfileModel.currentResidenceCity = p0;
                  },
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.educationalDegree,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createMaleProfileModel.educationalDegree =
                          p0;
                    });
                  },
                  selectedValue:
                      authCubit.createMaleProfileModel.educationalDegree,
                  dropdownButtonList:
                      DropdownButtonList.educationalDegreeList,
                )
              : DropdownButtonWidget(
                  onChanged: (p0) {
                    setState(() {
                      authCubit.createFemaleProfileModel.educationalDegree =
                          p0;
                    });
                  },
                  selectedValue:
                      authCubit.createFemaleProfileModel.educationalDegree,
                  dropdownButtonList:
                      DropdownButtonList.educationalDegreeList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.job,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          authCubit.isGender
              ? CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit.createMaleProfileModel.job = p0;
                  },
                )
              : CustomTextFormField(
                  obscureText: false,
                  onChanged: (p0) {
                    authCubit.createFemaleProfileModel.job = p0;
                  },
                ),
          SizedBox(height: 0.02 * screenHeight),
        ],
      ),
    );
  }
}
