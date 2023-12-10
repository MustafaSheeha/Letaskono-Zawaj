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
        if (state is GetMyUsersSuccessInitial) {}
        if (state is GetAllUsersFailureInitial) {}
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
                    profileCubit.userModel.yourThoughtAboutGuardianship,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.yourThoughtAboutGuardianship = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.jobDetails,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.jobDetails,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.jobDetails = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.isYourJobHalal,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.isYourJobHalal,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.isYourJobHalal = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.phobia,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.phobia,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.phobia = p0;
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
                initialValue: profileCubit.userModel.engagementEthics,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.engagementEthics = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              const Text(AppStrings.yourLifeGoals,
                  style: AppTextStyles.cairoW300PrimaryColor),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.yourLifeGoals,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.yourLifeGoals = p0;
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
                initialValue: profileCubit.userModel.learningReligiousKnowledge,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.learningReligiousKnowledge = p0;
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
                    profileCubit.userModel.yourThoughtAboutLifeSuccess,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.yourThoughtAboutLifeSuccess = p0;
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
                initialValue: profileCubit.userModel.diseasesAndDisability,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.diseasesAndDisability = p0;
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
                initialValue: profileCubit.userModel.isSmoking,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.isSmoking = p0;
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
                initialValue: profileCubit.userModel.detailedAddress,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.detailedAddress = p0;
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
                initialValue: profileCubit.userModel.listenMusicWatchMovies,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.listenMusicWatchMovies = p0;
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
                initialValue: profileCubit.userModel.broomParty,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.broomParty = p0;
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
                initialValue: profileCubit.userModel.howSpendSparetime,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.howSpendSparetime = p0;
                },
              ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.userModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : const Text(
                      AppStrings.canCook,
                      style: AppTextStyles.cairoW300PrimaryColor,
                      textAlign: TextAlign.end,
                    ),
              SizedBox(height: 0.01 * screenHeight),
              profileCubit.userModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : CustomTextFormField(
                      initialValue: profileCubit.userModel.canCook,
                      obscureText: false,
                      onChanged: (p0) {
                        profileCubit.userModel.canCook = p0;
                      },
                    ),
              profileCubit.userModel.gender == 'Male'
                  ? const SizedBox.shrink()
                  : SizedBox(height: 0.01 * screenHeight),
              const Text(
                AppStrings.yourThoughtsAlmostTime,
                style: AppTextStyles.cairoW300PrimaryColor,
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 0.01 * screenHeight),
              CustomTextFormField(
                initialValue: profileCubit.userModel.yourThoughtsAlmostTime,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.yourThoughtsAlmostTime = p0;
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
                initialValue: profileCubit.userModel.travelingAbroad,
                obscureText: false,
                onChanged: (p0) {
                  profileCubit.userModel.travelingAbroad = p0;
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
