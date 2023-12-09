import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';

class MarriageInfoForm extends StatelessWidget {
  const MarriageInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return CardContainer(
      widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        SizedBox(height: 0.02 * screenHeight),
        const CustomHeaderTitle(headerTitle: AppStrings.marriageInfo),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.tellAboutYou,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        authCubit.userModel.gender=="Male" ?
        CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {
            authCubit.createMaleProfileModel.tellAboutYou = p0;
          },
        ):CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {
            authCubit.createFemaleProfileModel.tellAboutYou = p0;
          },
        ),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.tellAboutPartner,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        authCubit.userModel.gender=="Male" ?
        CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {
            authCubit.createMaleProfileModel.tellAboutPartner = p0;
          },
        ):CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {
            authCubit.createFemaleProfileModel.tellAboutPartner = p0;
          },
        ),
        SizedBox(height: 0.02 * screenHeight),
      ]),
    );
  }
}
