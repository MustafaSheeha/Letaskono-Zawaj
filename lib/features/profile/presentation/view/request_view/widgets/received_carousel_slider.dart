import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/request_view/widgets/received_user_card.dart';

class ReceivedCarouselSlider extends StatefulWidget {
  const ReceivedCarouselSlider({super.key});

  @override
  State<ReceivedCarouselSlider> createState() => _ReceivedCarouselSliderState();
}

class _ReceivedCarouselSliderState extends State<ReceivedCarouselSlider> {
  bool isSendProfileOpen = false;

  List<Widget> buildCardList(int listLength, Function()? onTapExpandLess,
      Function()? onTapExpandMore) {
    int index = 0;
    List<Widget> cardList = [];
    for (index; index < listLength; index++) {
      cardList.add(ReceivedUserCard(
        isProfileOpen: isSendProfileOpen,
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 0.02 * screenHeight),
              CarouselSlider(
                  items: buildCardList(
                    profileCubit.myReceivedUserModelList.length,
                    () {
                      setState(() {
                        isSendProfileOpen = false;
                      });
                    },
                    () {
                      setState(() {
                        isSendProfileOpen = true;
                      });
                    },
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        isSendProfileOpen = false;
                        profileCubit.receivedIndex = index;
                        print(
                            'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
                        print(profileCubit.receivedIndex);
                        print(
                            'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
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
              !isSendProfileOpen
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
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.nationality,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .nationality ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCountry,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .currentResidenceCountry ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCity,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .currentResidenceCity ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.educationalDegree,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .educationalDegree ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.job,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
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
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .age ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.height,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .height ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.weight,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .weight ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.skinColor,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
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
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .prayerCommitment ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.clothStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .clothStyle ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.quranMemorizing,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .quranMemorizing ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.acceptToWearNiqab,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .acceptToWearNiqab ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourSheikhs,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              profileCubit
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                            const Text(
                              AppStrings.isParentKnowAboutLetaskono,
                              style: AppTextStyles.cairoW800PrimaryColor,
                            ),
                            Text(
                              profileCubit
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
                                      .isParentKnowAboutLetaskono ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.youAcceptToMarryWithoutQaamah,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
                                      .youAcceptToMarryWithoutQaamah ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.parentAcceptToMarryWithoutQaamah,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
                                      .parentAcceptToMarryWithoutQaamah ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(
                              AppStrings.fatherJob,
                              style: AppTextStyles.cairoW800PrimaryColor,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              profileCubit
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
                                      .motherJob ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.boysNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .myReceivedUserModelList[
                                                profileCubit.receivedIndex]
                                            .boysNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.girlsNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .myReceivedUserModelList[
                                                profileCubit.receivedIndex]
                                            .girlsNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.howOldYourChildren,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            profileCubit
                                        .myReceivedUserModelList[
                                            profileCubit.receivedIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    profileCubit
                                            .myReceivedUserModelList[
                                                profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.sendIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
                                      .myReceivedUserModelList[
                                          profileCubit.receivedIndex]
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
