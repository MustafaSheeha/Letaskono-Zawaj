
import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return const Dialog(
            backgroundColor: AppColors.white,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomHeaderTitle(headerTitle: AppStrings.searchFilter),
                  Text(AppStrings.martialStatus,
                style: AppTextStyles.cairoW300PrimaryColor),
                  Text(AppStrings.nationality,
                style: AppTextStyles.cairoW300PrimaryColor),
                  Text(AppStrings.currentResidenceCountry,
                style: AppTextStyles.cairoW300PrimaryColor),
                  Text(AppStrings.currentResidenceCity,
                style: AppTextStyles.cairoW300PrimaryColor),
                
                ],
              ),
            ),
          );
        },);
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.searchFilter,style: AppTextStyles.cairoW800PrimaryColor,),
          Icon(Icons.filter_list)
        ],
      ),
    );
  }
}
