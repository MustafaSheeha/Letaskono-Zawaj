import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
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
        if (state is GetMyUsersSuccessState) {}
        if (state is GetMyUsersFailureState) {}
      },
      builder: (context, state) {
        return CardContainer(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 0.02 * screenHeight),
              const CustomHeaderTitle(headerTitle: AppStrings.familyInfo),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(AppStrings.isParentKnowAboutLetaskono,
                      style: AppTextStyles.cairoW300PrimaryColor),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.myUserModel.isParentKnowAboutLetaskono =
                              p0;
                        });
                      },
                      selectedValue:
                          profileCubit.myUserModel.isParentKnowAboutLetaskono,
                      dropdownButtonList:
                          DropdownButtonList.isParentKnowAboutLetaskonoList,
                    ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(
                      AppStrings.youAcceptToMarryWithoutQaamah,
                      style: AppTextStyles.cairoW300PrimaryColor,
                      textAlign: TextAlign.end,
                    ),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit.myUserModel.youAcceptToMarryWithoutQaamah =
                              p0;
                        });
                      },
                      selectedValue:
                          profileCubit.myUserModel.youAcceptToMarryWithoutQaamah,
                      dropdownButtonList:
                          DropdownButtonList.youAcceptToMarryWithoutQaamahList,
                    ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(
                      AppStrings.parentAcceptToMarryWithoutQaamah,
                      style: AppTextStyles.cairoW300PrimaryColor,
                      textAlign: TextAlign.end,
                    ),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : DropdownButtonWidget(
                      onChanged: (p0) {
                        setState(() {
                          profileCubit
                              .myUserModel.parentAcceptToMarryWithoutQaamah = p0;
                        });
                      },
                      selectedValue: profileCubit
                          .myUserModel.parentAcceptToMarryWithoutQaamah,
                      dropdownButtonList: DropdownButtonList
                          .parentAcceptToMarryWithoutQaamahhList,
                    ),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(
                      AppStrings.parentPhone,
                      style: AppTextStyles.cairoW300PrimaryColor,
                      textAlign: TextAlign.end,
                    ),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : CustomTextFormField(
                      initialValue: profileCubit.myUserModel.parentPhone,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.myUserModel.parentPhone = p0;
                      },
                    ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.fatherJob,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.fatherJob,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.fatherJob = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.motherJob,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.motherJob,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.motherJob = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.boysNumber,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.boysNumber,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.boysNumber = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.girlsNumber,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.girlsNumber,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.girlsNumber = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.howOldYourChildren,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.howOldYourChildren,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.howOldYourChildren = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.yourRelationWithFamily,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.yourRelationWithFamily,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourRelationWithFamily = p0;
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
