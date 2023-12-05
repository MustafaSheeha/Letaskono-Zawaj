import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/features/auth/presentation/view/widgets/auth_container.dart';

class FemaleParentInfoForm extends StatelessWidget {
  const FemaleParentInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AuthContainer(
        widget: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CustomHeaderTitle(headerTitle: AppStrings.parentInfo),
        const Text(
          AppStrings.isParentKnowAboutLetaskono,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
            selectedValue: BlocProvider.of<AuthCubit>(context)
                .createFemaleProfileModel
                .isParentKnowAboutLetaskono,
            dropdownButtonList:
                DropdownButtonList.isParentKnowAboutLetaskonoList),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.youAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
            selectedValue: BlocProvider.of<AuthCubit>(context)
                .createFemaleProfileModel
                .youAcceptToMarryWithoutQaamah,
            dropdownButtonList:
                DropdownButtonList.youAcceptToMarryWithoutQaamahList),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.parentAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
            selectedValue: BlocProvider.of<AuthCubit>(context)
                .createFemaleProfileModel
                .parentAcceptToMarryWithoutQaamah,
            dropdownButtonList:
                DropdownButtonList.parentAcceptToMarryWithoutQaamahhList),
        SizedBox(height: 0.01 * screenHeight),
        const Text(AppStrings.parentPhone, style: AppTextStyles.cairoW300PrimaryColor),
        SizedBox(height: 0.01 * screenHeight),
        CustomTextFormField(
          obscureText: false,
          onChanged: (p0) {},
        ),
        SizedBox(height: 0.01 * screenHeight),
      ],
    ));
  }
}
