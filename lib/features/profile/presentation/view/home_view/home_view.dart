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
        if (state is GetMyUsersSuccessState) {
        } else if (state is GetMyUsersFailureState) {}
      },
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: flutterAppBar(),
          endDrawer: const CustomDrawer(),
          body: state is GetMyUsersLoadingState
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
                        Text(profileCubit.myUserModel.name.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.email,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.email.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: screenHeight * 0.018),
                        const Text(AppStrings.phoneNumber,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.phone.toString(),
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
                    // general Info
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.generalInfo),
                        const Text(AppStrings.martialStatus,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.maritalStatus.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.nationality,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.nationality.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCountry,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.myUserModel.currentResidenceCountry
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCity,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.myUserModel.currentResidenceCity
                                .toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.educationalDegree,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                            profileCubit.myUserModel.educationalDegree.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.job,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.job.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    // personal Info
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.personalInfo),
                        const Text(AppStrings.age,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.age.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.height,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.height.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.weight,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.weight.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.skinColor,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.skinColor.toString(),
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    // religious Info
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.religiousInfo),
                        const Text(AppStrings.prayerCommitment,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.prayerCommitment.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const Text(AppStrings.faceStyle,
                                style: AppTextStyles.cairoW800PrimaryColor)
                            : const Text(AppStrings.clothStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                        profileCubit.myUserModel.gender == 'Male'
                            ? Text(profileCubit.myUserModel.faceStyle.toString(),
                                style: AppTextStyles.cairoW800Black)
                            : Text(profileCubit.myUserModel.clothStyle.toString(),
                                style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.quranMemorizing,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(profileCubit.myUserModel.quranMemorizing.toString(),
                            style: AppTextStyles.cairoW800Black),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.acceptToWearNiqab,
                                style: AppTextStyles.cairoW800PrimaryColor),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.acceptToWearNiqab
                                    .toString(),
                                style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.morningEveningAzkar,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.morningEveningAzkar == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.morningEveningAzkar
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    // marriage Info
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
                          profileCubit.myUserModel.tellAboutYou.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.tellAboutPartner,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.tellAboutPartner.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    //  family Info
                    CardContainer(
                        widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.familyInfo),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.isParentKnowAboutLetaskono,
                                style: AppTextStyles.cairoW300PrimaryColor),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel
                                            .isParentKnowAboutLetaskono ==
                                        null
                                    ? AppStrings.noDataFound
                                    : profileCubit
                                        .myUserModel.isParentKnowAboutLetaskono
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.youAcceptToMarryWithoutQaamah,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel
                                            .youAcceptToMarryWithoutQaamah ==
                                        null
                                    ? AppStrings.noDataFound
                                    : profileCubit
                                        .myUserModel.youAcceptToMarryWithoutQaamah
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.parentAcceptToMarryWithoutQaamah,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel
                                            .parentAcceptToMarryWithoutQaamah ==
                                        null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel
                                        .parentAcceptToMarryWithoutQaamah
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.parentPhone,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.parentPhone == null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel.parentPhone
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.fatherJob,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.myUserModel.fatherJob == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.fatherJob.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.motherJob,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.myUserModel.motherJob == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.motherJob.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.boysNumber,
                                style: AppTextStyles.cairoW300PrimaryColor),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.boysNumber == null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel.boysNumber
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.girlsNumber,
                                style: AppTextStyles.cairoW300PrimaryColor),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.girlsNumber == null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel.girlsNumber
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : const Text(AppStrings.howOldYourChildren,
                                style: AppTextStyles.cairoW300PrimaryColor),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.howOldYourChildren ==
                                        null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel.howOldYourChildren
                                        .toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.maritalStatus == 'أعزب'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourRelationWithFamily,
                            style: AppTextStyles.cairoW300PrimaryColor),
                        Text(
                          profileCubit.myUserModel.yourRelationWithFamily == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.yourRelationWithFamily
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    //  additional Info
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
                          profileCubit.myUserModel.yourThoughtAboutGuardianship ==
                                  null
                              ? AppStrings.noDataFound
                              : profileCubit
                                  .myUserModel.yourThoughtAboutGuardianship
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.jobDetails,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.jobDetails == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.jobDetails.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.isYourJobHalal,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.isYourJobHalal == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.isYourJobHalal
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.phobia,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.phobia == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.phobia.toString(),
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
                          profileCubit.myUserModel.engagementEthics == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.engagementEthics
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourLifeGoals,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.yourLifeGoals == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.yourLifeGoals.toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.learningReligiousKnowledge,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.learningReligiousKnowledge ==
                                  null
                              ? AppStrings.noDataFound
                              : profileCubit
                                  .myUserModel.learningReligiousKnowledge
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.yourThoughtAboutLifeSuccess,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.yourThoughtAboutLifeSuccess ==
                                  null
                              ? AppStrings.noDataFound
                              : profileCubit
                                  .myUserModel.yourThoughtAboutLifeSuccess
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.diseasesAndDisability,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.diseasesAndDisability == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.diseasesAndDisability
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.isSmoking,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        Text(
                          profileCubit.myUserModel.isSmoking == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.isSmoking.toString(),
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
                          profileCubit.myUserModel.detailedAddress == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.detailedAddress
                                  .toString(),
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
                          profileCubit.myUserModel.listenMusicWatchMovies == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.listenMusicWatchMovies
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
                          profileCubit.myUserModel.broomParty == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.broomParty.toString(),
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
                          profileCubit.myUserModel.howSpendSparetime == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.howSpendSparetime
                                  .toString(),
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : const Text(
                                AppStrings.canCook,
                                style: AppTextStyles.cairoW300PrimaryColor,
                                textAlign: TextAlign.end,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : Text(
                                profileCubit.myUserModel.canCook == null
                                    ? AppStrings.noDataFound
                                    : profileCubit.myUserModel.canCook.toString(),
                                style: AppTextStyles.cairoW800Black,
                                textAlign: TextAlign.center,
                              ),
                        profileCubit.myUserModel.gender == 'Male'
                            ? const SizedBox.shrink()
                            : SizedBox(height: 0.02 * screenHeight),
                        const Text(
                          AppStrings.yourThoughtsAlmostTime,
                          style: AppTextStyles.cairoW800PrimaryColor,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          profileCubit.myUserModel.yourThoughtsAlmostTime == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.yourThoughtsAlmostTime
                                  .toString(),
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
                          profileCubit.myUserModel.travelingAbroad == null
                              ? AppStrings.noDataFound
                              : profileCubit.myUserModel.travelingAbroad
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
