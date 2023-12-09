import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/utils/functions/flutter_app_bar.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_drawer.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/profile/presentation/view/widgets/card_user.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  bool isProfileOpen = false;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: flutterAppBar(),
      endDrawer: const CustomDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(height: 0.02 * screenHeight),
          CarouselSlider(
              items: [
                UserCard(favoriteSaveOrDelete: false,
                  isProfileOpen: isProfileOpen,
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
                UserCard(favoriteSaveOrDelete: false,
                  isProfileOpen: isProfileOpen,
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
                UserCard(favoriteSaveOrDelete: false,
                  isProfileOpen: isProfileOpen,
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
                UserCard(favoriteSaveOrDelete: false,
                  isProfileOpen: isProfileOpen,
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
                UserCard(favoriteSaveOrDelete: false,
                  isProfileOpen: isProfileOpen,
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
              ],
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    isProfileOpen = false;
                  });
                },
                enableInfiniteScroll: false,
                scrollPhysics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                height: 0.6 * screenHeight,
                enlargeCenterPage: true,
                autoPlay: false,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                initialPage: 3,
                scrollDirection: Axis.horizontal,
                pauseAutoPlayOnTouch: true,
              )),
          !isProfileOpen
              ? const SizedBox()
              : Column(
                  children: [
                    // SizedBox(height: 0.04 * screenHeight),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.generalInfo),
                        const Text(AppStrings.martialStatus,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('متزوج',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.nationality,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('مصرى', style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCountry,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('السعودية',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.currentResidenceCity,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('الرياض',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.educationalDegree,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('الشهادة الجامعية',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.job,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('مطور برمجيات',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    SizedBox(height: 0.02 * screenHeight),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.personalInfo),
                        const Text(AppStrings.age,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('33', style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.height,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('199', style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.weight,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('99', style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.skinColor,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('بيضاء',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    SizedBox(height: 0.02 * screenHeight),
                    CardContainer(
                        widget: Column(
                      children: [
                        SizedBox(height: 0.02 * screenHeight),
                        const CustomHeaderTitle(
                            headerTitle: AppStrings.religiousInfo),
                        const Text(AppStrings.prayerCommitment,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('أصلى جميع الصلوات فى وقتها فى المسجد',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.faceStyle,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('لحية خفيفة',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.quranMemorizing,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text('أربعة أجزاء',
                            style: AppTextStyles.cairoW800Black),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    SizedBox(height: 0.02 * screenHeight),
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
                        const Text(
                          'ملتزم وعلاقته بربنا قوية ويكون حنين واطول منى ومش بيشرب سجاير وأعزب وسنه من 28 الى 30',
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                        const Text(AppStrings.tellAboutPartner,
                            style: AppTextStyles.cairoW800PrimaryColor),
                        const Text(
                          'طيبة وحنينة وجدعة ومحترمة  طيبة وحنينة وجدعة طيبة وحنينة وجدعة طيبة وحنينة وجدعة',
                          style: AppTextStyles.cairoW800Black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 0.02 * screenHeight),
                      ],
                    )),
                    SizedBox(height: 0.1 * screenHeight),
                  ],
                )
        ],
      ),
    );
  }
}
