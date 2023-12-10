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

class EditPersonalInfoForm extends StatefulWidget {
  const EditPersonalInfoForm({super.key});

  @override
  State<EditPersonalInfoForm> createState() => _EditPersonalInfoFormState();
}

class _EditPersonalInfoFormState extends State<EditPersonalInfoForm> {
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
        return CardContainer(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 0.02 * screenHeight),
              const CustomHeaderTitle(headerTitle: AppStrings.personalInfo),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.age,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.age,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.age = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.height,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.height,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.height = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.weight,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.weight,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.weight = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.skinColor,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              DropdownButtonWidget(
                onChanged: (p0) {
                  setState(() {
                    profileCubit.userModel.skinColor = p0;
                  });
                },
                selectedValue: profileCubit.userModel.skinColor,
                dropdownButtonList: DropdownButtonList.skinColorList,
              ),
              SizedBox(height: 0.02 * screenHeight),
            ],
          ),
        );
      },
    );
  }
}
