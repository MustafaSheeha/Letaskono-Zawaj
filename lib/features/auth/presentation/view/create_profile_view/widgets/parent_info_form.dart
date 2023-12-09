import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';

class ParentInfoForm extends StatelessWidget {
  const ParentInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardContainer(
      widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        CustomHeaderTitle(headerTitle: AppStrings.parentInfo),
        Text(
          AppStrings.isParentKnowAboutLetaskono,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        Text(
          AppStrings.youAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        Text(
          AppStrings.parentAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        Text(
          AppStrings.parentPhone,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
      ]),
    );
  }
}
