
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';
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
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 0.02 * screenHeight),
              CarouselSlider(
                  items: buildCardList(
                    searchCubit.femaleUserModelList.length,
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
                        searchCubit.index = index;
                        print(
                            'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
                        print(searchCubit.index);
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
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.nationality,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .nationality ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCountry,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .currentResidenceCountry ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.currentResidenceCity,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .currentResidenceCity ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.educationalDegree,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .educationalDegree ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.job,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit
                                        .femaleUserModelList[searchCubit.index].job ??
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
                                searchCubit
                                        .femaleUserModelList[searchCubit.index].age ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.height,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .height ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.weight,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .weight ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.skinColor,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
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
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .prayerCommitment ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.clothStyle,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .clothStyle ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.quranMemorizing,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .quranMemorizing ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.acceptToWearNiqab,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                                searchCubit.femaleUserModelList[searchCubit.index]
                                        .acceptToWearNiqab ??
                                    AppStrings.noDataFound,
                                style: AppTextStyles.cairoW800Black),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourSheikhs,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .tellAboutYou ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.tellAboutPartner,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .motherJob ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.boysNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    searchCubit.femaleUserModelList[searchCubit.index]
                                            .boysNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.girlsNumber,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    searchCubit.femaleUserModelList[searchCubit.index]
                                            .girlsNumber ??
                                        AppStrings.noDataFound,
                                    style: AppTextStyles.cairoW800Black,
                                    textAlign: TextAlign.center,
                                  ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : SizedBox(height: 0.02 * screenHeight),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : const Text(
                                    AppStrings.howOldYourChildren,
                                    style: AppTextStyles.cairoW800PrimaryColor,
                                    textAlign: TextAlign.center,
                                  ),
                            searchCubit.femaleUserModelList[searchCubit.index]
                                        .maritalStatus ==
                                    'عزباء'
                                ? const SizedBox.shrink()
                                : Text(
                                    searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .yourThoughtAboutGuardianship ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.jobDetails,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .jobDetails ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isYourJobHalal,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .isYourJobHalal ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.phobia,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .engagementEthics ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourLifeGoals,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .yourLifeGoals ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.learningReligiousKnowledge,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .learningReligiousKnowledge ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtAboutLifeSuccess,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .yourThoughtAboutLifeSuccess ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.diseasesAndDisability,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .diseasesAndDisability ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.isSmoking,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .detailedAddress ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.listenMusicWatchMovies,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .broomParty ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.howSpendSparetime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .howSpendSparetime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.canCook,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .canCook ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.yourThoughtsAlmostTime,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
                                      .yourThoughtsAlmostTime ??
                                  AppStrings.noDataFound,
                              style: AppTextStyles.cairoW800Black,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.02 * screenHeight),
                            const Text(AppStrings.travelingAbroad,
                                style: AppTextStyles.cairoW800PrimaryColor),
                            Text(
                              searchCubit.femaleUserModelList[searchCubit.index]
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
