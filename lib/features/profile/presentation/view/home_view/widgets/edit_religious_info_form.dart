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

class EditReligiousInfoForm extends StatefulWidget {
  const EditReligiousInfoForm({super.key});

  @override
  State<EditReligiousInfoForm> createState() => _EditReligiousInfoFormState();
}

class _EditReligiousInfoFormState extends State<EditReligiousInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetMyUsersSuccessState) {}
        if (state is GetMyUsersFailureState) {}
      },
      builder: (context, state) {
        return CardContainer(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 0.02 * screenHeight),
              const CustomHeaderTitle(headerTitle: AppStrings.religiousInfo),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.prayerCommitment,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              DropdownButtonWidget(
                onChanged: (p0) {
                  setState(() {
                    profileCubit.myUserModel.prayerCommitment = p0;
                  });
                },
                selectedValue: profileCubit.myUserModel.prayerCommitment,
                dropdownButtonList: DropdownButtonList.prayerCommitmentList,
              ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == "Male"
                  ? const Text(AppStrings.faceStyle,
                      style: AppTextStyles.cairoW300PrimaryColor)
                  : const Text(AppStrings.clothStyle,
                      style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == "Male"
                  ? DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.myUserModel.faceStyle = p0;
                        });
                      },
                      selectedValue: profileCubit.myUserModel.faceStyle,
                      dropdownButtonList: DropdownButtonList.faceStyleList,
                    )
                  : DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.myUserModel.clothStyle = p0;
                        });
                      },
                      selectedValue: profileCubit.myUserModel.clothStyle,
                      dropdownButtonList: DropdownButtonList.clothStyleList,
                    ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.quranMemorizing,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              DropdownButtonWidget(
                onChanged: (p0) {
                  setState(() {
                    profileCubit.myUserModel.quranMemorizing = p0;
                  });
                },
                selectedValue: profileCubit.myUserModel.quranMemorizing,
                dropdownButtonList: DropdownButtonList.quranMemorizingList,
              ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == "Male"
                  ? const SizedBox.shrink()
                  : const Text(AppStrings.acceptToWearNiqab,
                      style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == "Male"
                  ? const SizedBox.shrink()
                  : DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.myUserModel.acceptToWearNiqab = p0;
                        });
                      },
                      selectedValue: profileCubit.myUserModel.acceptToWearNiqab,
                      dropdownButtonList:
                          DropdownButtonList.acceptToWearNiqabList,
                    ),
              profileCubit.myUserModel.gender == "Male"
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.yourSheikhs,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.yourSheikhs,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourSheikhs = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.morningEveningAzkar,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.morningEveningAzkar,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.morningEveningAzkar = p0;
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
