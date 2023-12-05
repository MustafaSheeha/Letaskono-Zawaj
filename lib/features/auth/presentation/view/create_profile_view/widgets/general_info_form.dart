import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
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
    return AuthContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomHeaderTitle(headerTitle: AppStrings.generalInfo),
          const Text(AppStrings.martialStatus,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          BlocProvider.of<AuthCubit>(context).isGender
              ? DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createMaleProfileModel
                      .maritalStatus,
                  dropdownButtonList: DropdownButtonList.martialStatusList,
                )
              : DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createFemaleProfileModel
                      .maritalStatus,
                  dropdownButtonList: DropdownButtonList.martialStatusList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.nationality,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          BlocProvider.of<AuthCubit>(context).isGender
              ? DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createMaleProfileModel
                      .nationality,
                  dropdownButtonList: DropdownButtonList.nationalityList,
                )
              : DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createFemaleProfileModel
                      .nationality,
                  dropdownButtonList: DropdownButtonList.nationalityList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.currentResidenceCountry,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.currentResidenceCity,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.educationalDegree,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          BlocProvider.of<AuthCubit>(context).isGender
              ? DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createMaleProfileModel
                      .educationalDegree,
                  dropdownButtonList: DropdownButtonList.nationalityList,
                )
              : DropdownButtonWidget(
                  selectedValue: BlocProvider.of<AuthCubit>(context)
                      .createFemaleProfileModel
                      .educationalDegree,
                  dropdownButtonList: DropdownButtonList.educationalDegreeList,
                ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(AppStrings.job,
              style: AppTextStyles.cairoW300PrimaryColor),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
        ],
      ),
    );
  }
}
