import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_button.dart';

class UserCard extends StatelessWidget {
  const UserCard(
      {super.key,
      this.onTapExpandMore,
      required this.isProfileOpen,
      this.onTapExpandLess, required this.favoriteSaveOrDelete});
  final Function()? onTapExpandMore;
  final Function()? onTapExpandLess;
  final bool isProfileOpen;
  final bool favoriteSaveOrDelete;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(65)),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 5.0,
                offset: Offset(3.0, 3.0))
          ]),
      child: Column(
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
                  fontSize:  0.03*screenWidth,
                ),
              ),
           favoriteSaveOrDelete?   Container(
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CustomTextButton(
                  onPressed: () {},
                  text: AppStrings.saveProfileToFavorite,
                  fontSize: 0.03*screenWidth,
                ),
              ): Container(
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: CustomTextButton(
                  onPressed: () {},
                  text: AppStrings.deleteProfileFromFavorite,
                  fontSize: 0.03*screenWidth,
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
          const CustomHeaderTitle(headerTitle: 'عروسة منتقبة سواد 29 سنة'),
          const Text('تعيش فى مصر - الاسماعيلية',
              style: AppTextStyles.cairoW300PrimaryColor),
          const Text('الحالة الاجتماعية : عزباء',
              style: AppTextStyles.cairoW300PrimaryColor),
          isProfileOpen
              ? InkWell(
                  onTap: onTapExpandLess,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.expand_less, color: AppColors.primaryColor),
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
                      Icon(Icons.expand_more, color: AppColors.primaryColor),
                      Text(AppStrings.expandMore,
                          style: AppTextStyles.cairoW300PrimaryColor),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
