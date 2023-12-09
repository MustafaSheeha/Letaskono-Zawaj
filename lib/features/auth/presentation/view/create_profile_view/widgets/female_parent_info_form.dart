import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letaskono_zawaj/core/database/drop_down_buttom_list.dart';
import 'package:letaskono_zawaj/core/utils/app_strings.dart';
import 'package:letaskono_zawaj/core/utils/app_text_styles.dart';
import 'package:letaskono_zawaj/core/widgets/custom_header_title.dart';
import 'package:letaskono_zawaj/core/widgets/custom_text_form_field.dart';
import 'package:letaskono_zawaj/core/widgets/dropdown_button_widget.dart';
import 'package:letaskono_zawaj/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:letaskono_zawaj/core/widgets/card_container.dart';

class FemaleParentInfoForm extends StatefulWidget {
  const FemaleParentInfoForm({super.key});

  @override
  State<FemaleParentInfoForm> createState() => _FemaleParentInfoFormState();
}

class _FemaleParentInfoFormState extends State<FemaleParentInfoForm> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return CardContainer(
        widget: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 0.02 * screenHeight),
        const CustomHeaderTitle(headerTitle: AppStrings.parentInfo),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.isParentKnowAboutLetaskono,
          style: AppTextStyles.cairoW300PrimaryColor,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
          onChanged: (p0) {
            setState(() {
              authCubit.createFemaleProfileModel.isParentKnowAboutLetaskono =
                  p0;
            });
          },
          selectedValue:
              authCubit.createFemaleProfileModel.isParentKnowAboutLetaskono,
          dropdownButtonList: DropdownButtonList.isParentKnowAboutLetaskonoList,
        ),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.youAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
          onChanged: (p0) {
            setState(() {
              authCubit.createFemaleProfileModel.youAcceptToMarryWithoutQaamah =
                  p0;
            });
          },
          selectedValue:
              authCubit.createFemaleProfileModel.youAcceptToMarryWithoutQaamah,
          dropdownButtonList:
              DropdownButtonList.youAcceptToMarryWithoutQaamahList,
        ),
        SizedBox(height: 0.01 * screenHeight),
        const Text(
          AppStrings.parentAcceptToMarryWithoutQaamah,
          style: AppTextStyles.cairoW300PrimaryColor,
          textAlign: TextAlign.end,
        ),
        SizedBox(height: 0.01 * screenHeight),
        DropdownButtonWidget(
          onChanged: (p0) {
            setState(() {
              authCubit.createFemaleProfileModel
                  .parentAcceptToMarryWithoutQaamah = p0;
            });
          },
          selectedValue: authCubit
              .createFemaleProfileModel.parentAcceptToMarryWithoutQaamah,
          dropdownButtonList:
              DropdownButtonList.parentAcceptToMarryWithoutQaamahhList,
        ),
        SizedBox(height: 0.01 * screenHeight),
        const Text(AppStrings.parentPhone,
            style: AppTextStyles.cairoW300PrimaryColor),
        SizedBox(height: 0.01 * screenHeight),
        CustomTextFormField(
          keyboardType: TextInputType.phone,
          obscureText: false,
          onChanged: (p0) {
            authCubit.createFemaleProfileModel.parentPhone = p0;
          },
        ),
        SizedBox(height: 0.02 * screenHeight),
      ],
    ));
  }
}
