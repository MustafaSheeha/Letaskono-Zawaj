import 'package:flutter/widgets.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  CustomHeaderTitle(headerTitle: AppStrings.personalInfo),
                  Text(AppStrings.age,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.height,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.weight,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.skinColor,style: AppTextStyles.cairoW300PrimaryColor,),
                ]),
              );
  }
}