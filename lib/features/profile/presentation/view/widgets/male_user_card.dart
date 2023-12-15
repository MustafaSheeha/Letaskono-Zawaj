import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_cubit.dart';
import 'package:letaskono_zawaj/features/profile/presentation/cubits/search/search_state.dart';

class MaleUserCard extends StatelessWidget {
  const MaleUserCard({
    super.key,
    this.onTapExpandMore,
    required this.isProfileOpen,
    this.onTapExpandLess,
    required this.favoriteSaveOrDelete,
    required this.index,
  });
  final int index;
  final Function()? onTapExpandMore;
  final Function()? onTapExpandLess;
  final bool isProfileOpen;
  final bool favoriteSaveOrDelete;
  // final int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
        return CardContainer(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: CustomTextButton(
                      onPressed: () {},
                      text: AppStrings.sendRequest,
                      style: AppTextStyles.cairoW800PrimaryColor.copyWith(
                        color: AppColors.white,
                        fontSize: 0.025 * screenWidth,
                      ),
                    ),
                  ),
                  favoriteSaveOrDelete
                      ? Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: CustomTextButton(
                            onPressed: () async {
                              print(
                                  'Start saveMaleProfileToFavorite saveMaleProfileToFavorite saveMaleProfileToFavorite');
                              await searchCubit.saveMaleProfileToFavorite(
                                  partnerEmail: searchCubit
                                      .maleUserModelList[index].email!);
                              print(
                                  'End saveMaleProfileToFavorite saveMaleProfileToFavorite saveMaleProfileToFavorite');
                            },
                            text: AppStrings.saveProfileToFavorite,
                            style: AppTextStyles.cairoW800PrimaryColor.copyWith(
                              color: AppColors.white,
                              fontSize: 0.025 * screenWidth,
                            ),
                          ),
                        )
                      : Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: CustomTextButton(
                            onPressed: () {},
                            text: AppStrings.deleteProfileFromFavorite,
                            style: AppTextStyles.cairoW800PrimaryColor
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                ],
              ),
              ClipOval(
                  child: Image.asset(
                'assets/images/on_boarding_one.png',
                height: 130,
                width: 130,
              )),
              CustomHeaderTitle(
                  headerTitle:
                      'عريس ${searchCubit.maleUserModelList[index].faceStyle} ${searchCubit.maleUserModelList[index].age} سنة'),
              Text(
                  'يعيش فى ${searchCubit.maleUserModelList[index].currentResidenceCountry} - ${searchCubit.maleUserModelList[index].currentResidenceCity}',
                  style: AppTextStyles.cairoW300PrimaryColor),
              Text(
                  'الحالة الاجتماعية : ${searchCubit.maleUserModelList[index].maritalStatus}',
                  style: AppTextStyles.cairoW300PrimaryColor),
              isProfileOpen
                  ? InkWell(
                      onTap: onTapExpandLess,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.expand_less,
                              color: AppColors.primaryColor),
                          Text(AppStrings.expandLess,
                              style: AppTextStyles.cairoW300PrimaryColor),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: onTapExpandMore,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.expand_more,
                              color: AppColors.primaryColor),
                          Text(AppStrings.expandMore,
                              style: AppTextStyles.cairoW300PrimaryColor),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
