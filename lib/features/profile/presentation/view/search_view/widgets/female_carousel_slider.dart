
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/widgets/female_user_card.dart';

class FemaleCarouselSlider extends StatefulWidget {
 const FemaleCarouselSlider({super.key});

  @override
  State<FemaleCarouselSlider> createState() => _FemaleCarouselSliderState();
}

class _FemaleCarouselSliderState extends State<FemaleCarouselSlider> {
  bool isFemaleProfileOpen = false;

  List<Widget> buildCardList(int listLength, Function()? onTapExpandLess,
      Function()? onTapExpandMore) {
    int index = 0;
    List<Widget> cardList = [];
    for (index; index < listLength; index++) {
      cardList.add(FemaleUserCard(
        isProfileOpen: isFemaleProfileOpen,
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
    return BlocConsumer< ProfileCubit, ProfileState>(
      listener: (context, state) {
      },
      builder: (context, state) {
         ProfileCubit  profileCubit = BlocProvider.of< ProfileCubit>(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 0.02 * screenHeight),
              CarouselSlider(
                  items: buildCardList(
                     profileCubit.femaleUserModelList.length,
                    () {
                      setState(() {
                        isFemaleProfileOpen = false;
                      });
                    },
                    () {
                      setState(() {
                        isFemaleProfileOpen = true;
                      });
                    },
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        isFemaleProfileOpen = false;
                         profileCubit.femaleIndex = index;
                        print(
                            'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
                        print( profileCubit.femaleIndex);
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
              !isFemaleProfileOpen
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
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.nationality,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .nationality ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCountry,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .currentResidenceCountry ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCity,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .currentResidenceCity ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.educationalDegree,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .educationalDegree ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.job,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit
                                        .femaleUserModelList[ profileCubit.femaleIndex].job ??
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
                                        .femaleUserModelList[ profileCubit.femaleIndex].age ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.height,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .height ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.weight,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .weight ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.skinColor,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .prayerCommitment ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.clothStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .clothStyle ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.quranMemorizing,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .quranMemorizing ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.acceptToWearNiqab,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                 profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .acceptToWearNiqab ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourSheikhs,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .tellAboutYou ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.tellAboutPartner,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .motherJob ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.boysNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                     profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                            .boysNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.girlsNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                     profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                            .girlsNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.howOldYourChildren,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                             profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                     profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .yourThoughtAboutGuardianship ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.jobDetails,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .jobDetails ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isYourJobHalal,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .isYourJobHalal ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.phobia,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .engagementEthics ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourLifeGoals,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .yourLifeGoals ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.learningReligiousKnowledge,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .learningReligiousKnowledge ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtAboutLifeSuccess,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .yourThoughtAboutLifeSuccess ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.diseasesAndDisability,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .diseasesAndDisability ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isSmoking,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .detailedAddress ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.listenMusicWatchMovies,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .broomParty ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.howSpendSparetime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .howSpendSparetime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.canCook,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .canCook ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtsAlmostTime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
                                      .yourThoughtsAlmostTime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.travelingAbroad,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                               profileCubit.femaleUserModelList[ profileCubit.femaleIndex]
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
