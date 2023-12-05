import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_colors.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_elevated_button.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';

class WhoAreYouWidget extends StatefulWidget {
  const WhoAreYouWidget({
    super.key,
  });

  @override
  State<WhoAreYouWidget> createState() => _WhoAreYouWidgetState();
}

class _WhoAreYouWidgetState extends State<WhoAreYouWidget> {
  Color manButtonColor = AppColors.offWhite;
  Color manTextColor = AppColors.white;
  Color womanButtonColor = AppColors.offWhite;
  Color womanTextColor = AppColors.white;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).registerationUserModel.gender='Female';
              setState(() {
                womanButtonColor = AppColors.primaryColor;
                womanTextColor = AppColors.white;

                manButtonColor = AppColors.offWhite;
                manTextColor = AppColors.white;
              });
            },
            text: AppStrings.iamFemale,
            textColor: womanTextColor,
            backgroundColor: womanButtonColor),
        CustomElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).registerationUserModel.gender='Male';
              setState(() {
                manButtonColor = AppColors.primaryColor;
                manTextColor = AppColors.white;

                womanButtonColor = AppColors.offWhite;
                womanTextColor = AppColors.white;
              });
            },
            text: AppStrings.iamMale,
            textColor: manTextColor,
            backgroundColor: manButtonColor),
        Text(AppStrings.whoAreYou,
            style: AppTextStyles.cairoW300PrimaryColor
                .copyWith(fontSize: 0.035 * screenWidth)),
      ],
    );
  }
}
