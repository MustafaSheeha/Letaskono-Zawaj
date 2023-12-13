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

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    this.onTapExpandMore,
    required this.isProfileOpen,
    this.onTapExpandLess,
    required this.favoriteSaveOrDelete,
  });
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
                            onPressed: () {},
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
                      'عروسة ${searchCubit.userModelList[0].clothStyle} ${searchCubit.userModelList[0].age} سنة'),
              Text(
                  'تعيش فى ${searchCubit.userModelList[0].currentResidenceCountry} - ${searchCubit.userModelList[0].currentResidenceCity}',
                  style: AppTextStyles.cairoW300PrimaryColor),
              Text(
                  'الحالة الاجتماعية : ${searchCubit.userModelList[0].maritalStatus}',
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
