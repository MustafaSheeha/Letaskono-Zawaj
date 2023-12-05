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

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AuthContainer(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 0.02 * screenHeight),
          const CustomHeaderTitle(headerTitle: AppStrings.personalInfo),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.age,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            keyboardType: TextInputType.number,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.height,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            keyboardType: TextInputType.number,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.weight,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
          CustomTextFormField(
            obscureText: false,
            keyboardType: TextInputType.number,
            onChanged: (p0) {},
          ),
          SizedBox(height: 0.01 * screenHeight),
          const Text(
            AppStrings.skinColor,
            style: AppTextStyles.cairoW300PrimaryColor,
          ),
          SizedBox(height: 0.01 * screenHeight),
          DropdownButtonWidget(
              selectedValue: BlocProvider.of<AuthCubit>(context)
                  .createMaleProfileModel
                  .maritalStatus,
              dropdownButtonList: DropdownButtonList.skinColorList),
          SizedBox(height: 0.02 * screenHeight),
        ],
      ),
    );
  }
}
