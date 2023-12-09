import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is GetMyUsersSuccessInitial) {
        } else if (state is GetMyUsersFailureInitial) {}
      },
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: flutterAppBar(),
          endDrawer: const CustomDrawer(),
          body: state is GetMyUsersLoadingInitial
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.005),
                        const Text(AppStrings.name,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.name
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.email,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.email
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.phoneNumber,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.phone
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.accountStatus,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text(AppStrings.stillRevised,
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        CustomElevatedButton(
                          onPressed: () {},
                          text: AppStrings.editData,
                        ),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.generalInfo),
                        const Text(AppStrings.martialStatus,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.createMaleProfileModel.maritalStatus
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.nationality,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                            profileCubit.createMaleProfileModel.nationality
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCountry,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                            profileCubit.createMaleProfileModel.currentResidenceCountry
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCity,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                            profileCubit.createMaleProfileModel.currentResidenceCity
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.educationalDegree,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                            profileCubit.createMaleProfileModel.educationalDegree
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.job,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                            profileCubit.createMaleProfileModel.job
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.personalInfo),
                        const Text(AppStrings.age,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.age.toString(), style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.height,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.height.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.weight,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.weight.toString(), style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.skinColor,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.skinColor.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.religiousInfo),
                        const Text(AppStrings.prayerCommitment,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.prayerCommitment
                                .toString(),
                            style: AppTextStyles.cairoW800Black,textAlign: TextAlign.center,),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.faceStyle,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.faceStyle
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.quranMemorizing,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(profileCubit.createMaleProfileModel.quranMemorizing
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.marriageInfo),
                        const Text(
                          AppStrings.tellAboutYou,
                          style: AppTextStyles.cairoW800PrimaryColor,
                        ),
                         Text(
                         profileCubit.createMaleProfileModel.tellAboutYou
                                .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.tellAboutPartner,
                            style: AppTextStyles.cairoW800PrimaryColor),
                         Text(
                          profileCubit.createMaleProfileModel.tellAboutPartner
                                .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    SizedBox(height: 0.1 * screenHeight),
                  ],
                ),
        );
      },
    );
  }
}
