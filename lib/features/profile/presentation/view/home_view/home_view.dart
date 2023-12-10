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
import 'package:letaskono_zawaj/features/profile/presentation/view/home_view/widgets/edit_profile_view.dart';

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
                        Text(profileCubit.userModel.name.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.email,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.email.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.phoneNumber,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.phone.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.accountStatus,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text(AppStrings.stillRevised,
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        CustomElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfileView(),
                                ));
                          },
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
                        Text(profileCubit.userModel.maritalStatus.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.nationality,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.nationality.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCountry,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.userModel.currentResidenceCountry
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCity,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.userModel.currentResidenceCity
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.educationalDegree,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.userModel.educationalDegree.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.job,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.job.toString(),
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
                        Text(profileCubit.userModel.age.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.height,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.height.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.weight,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.weight.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.skinColor,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.skinColor.toString(),
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
                        Text(
                          profileCubit.userModel.prayerCommitment.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const Text(AppStrings.faceStyle,
                                style: AppTextStyles.cairoW800PrimaryColor)
                            : const Text(AppStrings.clothStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                        profileCubit.userModel.gender == 'Male'
                            ? Text(profileCubit.userModel.faceStyle.toString(),
                                style: AppTextStyles.cairoW800Black)
                            : Text(profileCubit.userModel.clothStyle.toString(),
                                style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.quranMemorizing,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.userModel.quranMemorizing.toString(),
                            style: AppTextStyles.cairoW800Black),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.acceptToWearNiqab,
                                style: AppTextStyles.cairoW800PrimaryColor),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.userModel.acceptToWearNiqab
                                    .toString(),
                                style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.morningEveningAzkar,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.morningEveningAzkar.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
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
                          profileCubit.userModel.tellAboutYou.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.tellAboutPartner,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.tellAboutPartner.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.familyInfo),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.isParentKnowAboutLetaskono,
                                style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.isParentKnowAboutLetaskono
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.youAcceptToMarryWithoutQaamah,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        Text(
                          profileCubit.userModel.youAcceptToMarryWithoutQaamah
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.parentAcceptToMarryWithoutQaamah,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        Text(
                          profileCubit
                              .userModel.parentAcceptToMarryWithoutQaamah
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.parentPhone,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        Text(
                          profileCubit.userModel.parentPhone.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.fatherJob,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.fatherJob.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.motherJob,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.motherJob.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.boysNumber,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.boysNumber.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.girlsNumber,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.girlsNumber.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.howOldYourChildren,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.howOldYourChildren.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourRelationWithFamily,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.userModel.yourRelationWithFamily
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    CardContainer(
                        widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.additionalInfo),
                        const Text(
                          AppStrings.yourThoughtAboutGuardianship,
                          style: AppTextStyles.cairoW800PrimaryColor,
                        ),
                        Text(
                          profileCubit.userModel.yourThoughtAboutGuardianship
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.jobDetails,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.jobDetails.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.isYourJobHalal,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.isYourJobHalal.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.phobia,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.phobia.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.engagementEthics,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.engagementEthics.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourLifeGoals,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.yourLifeGoals.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.learningReligiousKnowledge,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.learningReligiousKnowledge
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourThoughtAboutLifeSuccess,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.yourThoughtAboutLifeSuccess
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.diseasesAndDisability,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.diseasesAndDisability
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.isSmoking,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.userModel.isSmoking.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.detailedAddress,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.detailedAddress.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.listenMusicWatchMovies,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.listenMusicWatchMovies
                              .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.detailedAddress,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.broomParty.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.broomParty,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.howSpendSparetime.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.canCook,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.end,
                              ),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.userModel.canCook.toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.userModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.yourThoughtsAlmostTime,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.yourThoughtsAlmostTime.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.travelingAbroad,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.userModel.travelingAbroad.toString(),
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
