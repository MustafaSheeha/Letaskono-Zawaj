import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class EditAddittionalInfoForm extends StatefulWidget {
  const EditAddittionalInfoForm({super.key});

  @override
  State<EditAddittionalInfoForm> createState() =>
      _EditAddittionalInfoFormState();
}

class _EditAddittionalInfoFormState extends State<EditAddittionalInfoForm> {
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
              const CustomHeaderTitle(headerTitle: AppStrings.additionalInfo),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.yourThoughtAboutGuardianship,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue:
                    profileCubit.myUserModel.yourThoughtAboutGuardianship,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourThoughtAboutGuardianship = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.jobDetails,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.jobDetails,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.jobDetails = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.isYourJobHalal,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.isYourJobHalal,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.isYourJobHalal = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.phobia,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.phobia,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.phobia = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.engagementEthics,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.engagementEthics,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.engagementEthics = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.yourLifeGoals,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.yourLifeGoals,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourLifeGoals = p0;
                },
              ),
              // ///////////////////
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.learningReligiousKnowledge,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.learningReligiousKnowledge,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.learningReligiousKnowledge = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.yourThoughtAboutLifeSuccess,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue:
                    profileCubit.myUserModel.yourThoughtAboutLifeSuccess,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourThoughtAboutLifeSuccess = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.diseasesAndDisability,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.diseasesAndDisability,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.diseasesAndDisability = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.isSmoking,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.isSmoking,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.isSmoking = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.detailedAddress,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.detailedAddress,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.detailedAddress = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.listenMusicWatchMovies,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.listenMusicWatchMovies,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.listenMusicWatchMovies = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.broomParty,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.broomParty,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.broomParty = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.howSpendSparetime,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.howSpendSparetime,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.howSpendSparetime = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(
                      AppStrings.canCook,
                      style: AppTextStyles.cairoW300PrimaryColor,
                      textAlign: TextAlign.end,
                    ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : CustomTextFormField(
                      initialValue: profileCubit.myUserModel.canCook,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.myUserModel.canCook = p0;
                      },
                    ),
              profileCubit.myUserModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.yourThoughtsAlmostTime,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.yourThoughtsAlmostTime,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.yourThoughtsAlmostTime = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.travelingAbroad,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.myUserModel.travelingAbroad,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.myUserModel.travelingAbroad = p0;
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
