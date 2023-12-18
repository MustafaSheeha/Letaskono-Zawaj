import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/widgets/male_user_card.dart';

class MaleCarouselSlider extends StatefulWidget {
  const MaleCarouselSlider({super.key});

  @override
  State<MaleCarouselSlider> createState() => _MaleCarouselSliderState();
}

class _MaleCarouselSliderState extends State<MaleCarouselSlider> {
  bool isMaleProfileOpen = false;

  List<Widget> buildCardList(int listLength, Function()? onTapExpandLess,
      Function()? onTapExpandMore) {
    int index = 0;
    List<Widget> cardList = [];
    for (index; index < listLength; index++) {
      cardList.add(MaleUserCard(
        isProfileOpen: isMaleProfileOpen,
        favoriteSaveOrDelete: true,
        index: index,
        onTapExpandLess: onTapExpandLess,
        onTapExpandMore: onTapExpandMore,
      ));
    }
    return cardList;
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 0.02 * screenHeight),
              CarouselSlider(
                  items: buildCardList(
                    profileCubit.maleUserModelList.length,
                    () {
                      setState(() {
                        isMaleProfileOpen = false;
                      });
                    },
                    () {
                      setState(() {
                        isMaleProfileOpen = true;
                      });
                    },
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        isMaleProfileOpen = false;
                        profileCubit.maleIndex = index;
                      });
                    },
                    enableInfiniteScroll: false,
                    scrollPhysics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    height: 0.6 * screenHeight,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                  )),
              !isMaleProfileOpen
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        // SizedBox(height: 0.04 * screenHeight),
                        // General Info
                        CardContainer(
                            widget: Column(
                          children: [
                            SizedBox(height: 0.02 * screenHeight),
                            const CustomHeaderTitle(
                                headerTitle: AppStrings.generalInfo),
                            const Text(AppStrings.martialStatus,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .maritalStatus ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.nationality,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .nationality ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCountry,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .currentResidenceCountry ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCity,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .currentResidenceCity ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.educationalDegree,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .educationalDegree ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.job,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .job ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.02 * screenHeight),
                        // Personal Info
                        CardContainer(
                            widget: Column(
                          children: [
                            SizedBox(height: 0.02 * screenHeight),
                            const CustomHeaderTitle(
                                headerTitle: AppStrings.personalInfo),
                            const Text(AppStrings.age,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .age ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.height,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .height ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.weight,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .weight ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.skinColor,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .skinColor ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.02 * screenHeight),
                        // Religious Info
                        CardContainer(
                            widget: Column(
                          children: [
                            SizedBox(height: 0.02 * screenHeight),
                            const CustomHeaderTitle(
                                headerTitle: AppStrings.religiousInfo),
                            const Text(AppStrings.prayerCommitment,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .prayerCommitment ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.faceStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .faceStyle ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.quranMemorizing,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .maleUserModelList[
                                            profileCubit.maleIndex]
                                        .quranMemorizing ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourSheikhs,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourSheikhs ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.02 * screenHeight),
                        // Marriage Info
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
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .tellAboutYou ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.tellAboutPartner,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .tellAboutPartner ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.02 * screenHeight),
                        // Family Info
                        CardContainer(
                            widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 0.02 * screenHeight),
                            const CustomHeaderTitle(
                                headerTitle: AppStrings.familyInfo),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.isParentKnowAboutLetaskono,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .isParentKnowAboutLetaskono ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.youAcceptToMarryWithoutQaamah,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .youAcceptToMarryWithoutQaamah ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.parentAcceptToMarryWithoutQaamah,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .parentAcceptToMarryWithoutQaamah ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .gender ==
                                    'Male'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.fatherJob,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .fatherJob ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.motherJob,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .motherJob ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.boysNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .boysNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.girlsNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .girlsNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.howOldYourChildren,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit.maleUserModelList[profileCubit.maleIndex]
                                        .maritalStatus ==
                                    'أعزب'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .maleUserModelList[
                                                profileCubit.maleIndex]
                                            .howOldYourChildren ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.yourRelationWithFamily,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourRelationWithFamily ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.02 * screenHeight),
                        // Additional Info
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
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourThoughtAboutGuardianship ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.jobDetails,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .jobDetails ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isYourJobHalal,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .isYourJobHalal ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.phobia,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .phobia ??
                                  AppStrings.noDataFound,
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
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .engagementEthics ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourLifeGoals,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourLifeGoals ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.learningReligiousKnowledge,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .learningReligiousKnowledge ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtAboutLifeSuccess,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourThoughtAboutLifeSuccess ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.diseasesAndDisability,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .diseasesAndDisability ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isSmoking,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .isSmoking ??
                                  AppStrings.noDataFound,
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
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .detailedAddress ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.listenMusicWatchMovies,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .listenMusicWatchMovies ??
                                  AppStrings.noDataFound,
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
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .broomParty ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.howSpendSparetime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .howSpendSparetime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.canCook,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .canCook ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtsAlmostTime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .yourThoughtsAlmostTime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.travelingAbroad,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .maleUserModelList[profileCubit.maleIndex]
                                      .travelingAbroad ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                          ],
                        )),
                        SizedBox(height: 0.1 * screenHeight),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
