import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/models/user_model.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/profile/profile_state.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/favorite_view/widgets/favorite_user_card.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  int currentIndex = 0;
  bool isProfileOpen = false;
  List<Widget> buildCardList(
      {required int listLength,
      required Function()? onTapExpandLess,
      required Function()? onTapExpandMore}) {
    int index = 0;
    List<Widget> cardList = [];
    for (index; index < listLength; index++) {
      cardList.add(FavoriteUserCard(
        currentIndex: currentIndex,
        isProfileOpen: isProfileOpen,
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
      listener: (context, state) {
        if (state is GetMyFavoriteUsersSuccessState) {}
        if (state is GetMyFavoriteUsersFailureState) {}
      },
      builder: (context, state) {
        ProfileCubit profileCubit = BlocProvider.of<ProfileCubit>(context);
        List<UserModel> myFavoriteUserModelList =
            profileCubit.myFavoriteUserModelList;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: flutterAppBar(),
          endDrawer: const CustomDrawer(),
          body: state is GetMyFavoriteUsersLoadingState
              ? const Center(child: CircularProgressIndicator())
              : myFavoriteUserModelList.isEmpty
                  ? const Center(
                      child: Text(
                      AppStrings.youHaveNoFavorite,
                      style: AppTextStyles.cairoW800PrimaryColor,
                    ))
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        SizedBox(height: 0.06 * screenHeight),
                        CarouselSlider(
                            items: buildCardList(
                              listLength:
                                  profileCubit.myFavoriteUserModelList.length,
                              onTapExpandLess: () {
                                setState(() {
                                  isProfileOpen = false;
                                });
                              },
                              onTapExpandMore: () {
                                setState(() {
                                  isProfileOpen = true;
                                });
                              },
                            ),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  isProfileOpen = false;
                                  currentIndex = index;
                                  // ProfileCubit.favoriteIndex = index;
                                  // print(
                                  //     'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
                                  // print(ProfileCubit.favoriteIndex);
                                  // print(
                                  //     'currentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPagecurrentPage');
                                });
                              },
                              enableInfiniteScroll: false,
                              scrollPhysics: const BouncingScrollPhysics(),
                              clipBehavior: Clip.none,
                              height: 0.6 * screenHeight,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 2),
                              scrollDirection: Axis.horizontal,
                              pauseAutoPlayOnTouch: true,
                            )),
                        !isProfileOpen
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
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.nationality,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .nationality ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.currentResidenceCountry,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .currentResidenceCountry ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.currentResidenceCity,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .currentResidenceCity ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.educationalDegree,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .educationalDegree ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.job,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
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
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .age ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.height,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .height ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.weight,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .weight ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.skinColor,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
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
                                          headerTitle:
                                              AppStrings.religiousInfo),
                                      const Text(AppStrings.prayerCommitment,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .prayerCommitment ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.clothStyle,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .clothStyle ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.quranMemorizing,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .quranMemorizing ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.acceptToWearNiqab,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                          profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .acceptToWearNiqab ??
                                              AppStrings.noDataFound,
                                          style: AppTextStyles.cairoW800Black),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.yourSheikhs,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 0.02 * screenHeight),
                                      const CustomHeaderTitle(
                                          headerTitle: AppStrings.marriageInfo),
                                      const Text(
                                        AppStrings.tellAboutYou,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .tellAboutYou ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.tellAboutPartner,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 0.02 * screenHeight),
                                      const CustomHeaderTitle(
                                          headerTitle: AppStrings.familyInfo),
                                      const Text(
                                        AppStrings.isParentKnowAboutLetaskono,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .isParentKnowAboutLetaskono ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings
                                            .youAcceptToMarryWithoutQaamah,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .youAcceptToMarryWithoutQaamah ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings
                                            .parentAcceptToMarryWithoutQaamah,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .parentAcceptToMarryWithoutQaamah ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.fatherJob,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .fatherJob ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.motherJob,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .motherJob ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : SizedBox(
                                              height: 0.02 * screenHeight),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : const Text(
                                              AppStrings.boysNumber,
                                              style: AppTextStyles
                                                  .cairoW800PrimaryColor,
                                              textAlign: TextAlign.center,
                                            ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : Text(
                                              profileCubit
                                                      .myFavoriteUserModelList[
                                                          currentIndex]
                                                      .boysNumber ??
                                                  AppStrings.noDataFound,
                                              style:
                                                  AppTextStyles.cairoW800Black,
                                              textAlign: TextAlign.center,
                                            ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : SizedBox(
                                              height: 0.02 * screenHeight),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : const Text(
                                              AppStrings.girlsNumber,
                                              style: AppTextStyles
                                                  .cairoW800PrimaryColor,
                                              textAlign: TextAlign.center,
                                            ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : Text(
                                              profileCubit
                                                      .myFavoriteUserModelList[
                                                          currentIndex]
                                                      .girlsNumber ??
                                                  AppStrings.noDataFound,
                                              style:
                                                  AppTextStyles.cairoW800Black,
                                              textAlign: TextAlign.center,
                                            ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : SizedBox(
                                              height: 0.02 * screenHeight),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : const Text(
                                              AppStrings.howOldYourChildren,
                                              style: AppTextStyles
                                                  .cairoW800PrimaryColor,
                                              textAlign: TextAlign.center,
                                            ),
                                      profileCubit
                                                  .myFavoriteUserModelList[
                                                      currentIndex]
                                                  .maritalStatus ==
                                              'عزباء'
                                          ? const SizedBox.shrink()
                                          : Text(
                                              profileCubit
                                                      .myFavoriteUserModelList[
                                                          currentIndex]
                                                      .howOldYourChildren ??
                                                  AppStrings.noDataFound,
                                              style:
                                                  AppTextStyles.cairoW800Black,
                                              textAlign: TextAlign.center,
                                            ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.yourRelationWithFamily,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 0.02 * screenHeight),
                                      const CustomHeaderTitle(
                                          headerTitle:
                                              AppStrings.additionalInfo),
                                      const Text(
                                        AppStrings.yourThoughtAboutGuardianship,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .yourThoughtAboutGuardianship ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.jobDetails,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .jobDetails ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.isYourJobHalal,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .isYourJobHalal ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.phobia,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .phobia ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.engagementEthics,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .engagementEthics ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.yourLifeGoals,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .yourLifeGoals ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.learningReligiousKnowledge,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .learningReligiousKnowledge ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings
                                              .yourThoughtAboutLifeSuccess,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .yourThoughtAboutLifeSuccess ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.diseasesAndDisability,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .diseasesAndDisability ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.isSmoking,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .isSmoking ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.detailedAddress,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .detailedAddress ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.listenMusicWatchMovies,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .listenMusicWatchMovies ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                        AppStrings.broomParty,
                                        style:
                                            AppTextStyles.cairoW800PrimaryColor,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .broomParty ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.howSpendSparetime,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .howSpendSparetime ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.canCook,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .canCook ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(
                                          AppStrings.yourThoughtsAlmostTime,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
                                                .yourThoughtsAlmostTime ??
                                            AppStrings.noDataFound,
                                        style: AppTextStyles.cairoW800Black,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 0.02 * screenHeight),
                                      const Text(AppStrings.travelingAbroad,
                                          style: AppTextStyles
                                              .cairoW800PrimaryColor),
                                      Text(
                                        profileCubit
                                                .myFavoriteUserModelList[
                                                    currentIndex]
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
