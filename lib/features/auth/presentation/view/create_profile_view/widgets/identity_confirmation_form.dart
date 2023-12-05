import 'package:flutter/material.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/create_profile_view/widgets/id_image_picker.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class IdentityConfirmationForm extends StatelessWidget {
  const IdentityConfirmationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      widget: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const CustomHeaderTitle(headerTitle: AppStrings.identityConfirmation),
        const Text(AppStrings.idFrontSide,
            style: AppTextStyles.cairoW300PrimaryColor),
        IdImagePicker(
          onTap: () {},
          isFront: true,
        ),
        const Text(AppStrings.idBackSide, style: AppTextStyles.cairoW300PrimaryColor),
        IdImagePicker(onTap: () {}, isFront: false),
        const Text(AppStrings.idNumber, style: AppTextStyles.cairoW300PrimaryColor),
      ]),
    );
  }
}
