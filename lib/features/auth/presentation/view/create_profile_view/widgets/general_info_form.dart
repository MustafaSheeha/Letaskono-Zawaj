import 'package:flutter/widgets.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class GeneralInfoForm extends StatelessWidget {
  const GeneralInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  CustomHeaderTitle(headerTitle: AppStrings.generalInfo),
                  Text(AppStrings.martialStatus,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.nationality,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.currentResidenceCountry,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.currentResidenceCity,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.educationalDegree,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.job,style: AppTextStyles.cairoW300PrimaryColor,),
                ]),
              );
  }
}