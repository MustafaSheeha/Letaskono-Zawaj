import 'package:flutter/widgets.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class ReligiousInfoForm extends StatelessWidget {
  const ReligiousInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  CustomHeaderTitle(headerTitle: AppStrings.religiousInfo),
                  Text(AppStrings.prayerCommitment,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.faceStyle,style: AppTextStyles.cairoW300PrimaryColor,),
                  Text(AppStrings.quranMemorizing,style: AppTextStyles.cairoW300PrimaryColor,),
                ]),
              );
  }
}